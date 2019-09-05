# Creates a new journal entry and opens it with Vim
function New-JournalEntry {

  # Creates journal entry
  $journalPath = '~\OneDrive - SPR Consulting\Archive\2019\Journal\'
  $journalName = [String]::Concat('Journal ', (Get-Date -Format yyyy-MM-dd), '.txt')
  $journalFullName = ([System.IO.Path]::Combine($journalPath, $journalName))

  # Checks that it doesn't exist; otherwise opens existing
  if ([System.IO.File]::Exists($journalFullName)) {
    New-Item -Path $journalPath -Name $journalName
  }

  # Opens the journal entry with Vim
  Open-GVim $journalFullName
  }

Set-Alias j New-JournalEntry

# Adds a git checkpoint to my working directory
function New-Checkpoint {

  $cur = Get-Location
  $dir = '~\OneDrive - SPR Consulting\'
  Set-Location $dir

  $msg = [String]::Concat('Checkpoint ', (Get-Date -Format yyyy-MM-dd))
  git add .
  git commit -m $msg

  Set-Location $cur
}

# Populates todo with daily recurring tasks
function Add-RecurringDailyTasks {

  $tasks = Get-Content '~\Dropbox\Tasks\recurring.txt'
  Add-Content '~\Dropbox\Tasks\spr.txt' $tasks
}

# Options for fast-adding ideas to files
enum IdeaTypes {
  BlogIdeas
  ManagerQuestions
  ProjectIdeas
}

$listLocations = @{
  [IdeaTypes]::BlogIdeas = '~\OneDrive - SPR Consulting\Archive\2019\Drafts\blog-ideas.md';
  [IdeaTypes]::ManagerQuestions = '~\OneDrive - SPR Consulting\Archive\2019\Drafts\manager-questions.md';
  [IdeaTypes]::ProjectIdeas = '~\OneDrive - SPR Consulting\Archive\2019\Drafts\project-ideas.md'
}

# Quick-add an idea to the selected file
function Add-Idea {
  param(
  [Parameter(Mandatory, Position=0)]
  [IdeaTypes]$IdeaType,

  [Parameter(Mandatory, Position=1)]
  [String]$Idea
  )

  Add-Content -Path $listLocations.Item($IdeaType) -Value $Idea
}
