Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB6C33AD85
	for <soc@lists.linux.dev>; Wed,  6 May 2026 19:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778096950; cv=none; b=XdZ5/eb2aivnIsw0ekbO6/slJVxoTx5tXa4NUzkJ1KTrkX5YqJQyJfRJ3FaVTMfL212JOAJZ7+9b6ZaxrXEZaahThZMb6D5rYr3u6cs+3RAlPsjeAlA/2OmH4YI7Ivy4zGcNIeRl8AESJW3eEsh4SnIRB3bP9Q6IJuqMZeIQz3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778096950; c=relaxed/simple;
	bh=eKuy7X2bPfQQngcZlWjAGcHROH9JN9FtPA/+aDIQWeA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I5+shQB7TJgtj3wqxq3ZJYSHVN6JU13AT9ZkMcOg3/t1WMXtwoz6ZNxB3BBOVSmpDTGejydyQxtO4w0Xm6lPpNMzdH19QfIKAL3e5fxoQkCMqj26Q4lAiOCMUPB4WXb+5Wq4FGjcnsWf6IywDOWcTw5MEAHrj5lcYMZAA+wRgts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vph2x3BP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vph2x3BP"
Received: by smtp.kernel.org (Postfix)
	id A0A79C4AF09; Wed,  6 May 2026 19:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80ECDC2BCB0;
	Wed,  6 May 2026 19:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778096949;
	bh=eKuy7X2bPfQQngcZlWjAGcHROH9JN9FtPA/+aDIQWeA=;
	h=From:To:Cc:Subject:Date:From;
	b=Vph2x3BPSzZ5RIOODvIAYAR3IfRO4N9+RIa/ESncGOp5K1DmEV/6eps+gulCXJV6I
	 AMf6ehBJ3Sh+k8YHtUSB9WZFq2xYPqt+R4vbgK8EK2twX6mdUXFiHmBYtiKt2Ka+3M
	 pKIp4Bs8sd4OhtClurTG7ogR9ZtMLCtmKFqJxfVd8Yyzz8ZIIgy/14vKXNJlkWFDiV
	 BgXNWikpkNYydJtXz13wBFmFV4c0nbwA19sljfNLjibcrSRfJx/6o8tuCff1CKcrB+
	 uaMhEWjMhiu7dkVa6RGeVbo3psnZsrcrrATqPwoWAZ3eKxhTLUiV0dEILUqFUuIIjE
	 U0NpSud7BYeCg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>
Subject: [GIT PULL] firmware: arm_ffa: Fixes for v7.1-rc1(Round 2)
Date: Wed,  6 May 2026 20:46:00 +0100
Message-ID: <20260506194602.3474096-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Most of the issues addressed are found by sashiko and other AI agents.
It all started with me missing the report by Sashiko in [1]. Each round of
fix expanded the AI scope of review and unearthed more issues.

Regards,
Sudeep

[1] https://sashiko.dev/#/patchset/20260402113939.930221-1-sebastianene@google.com

-->8

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fixes-7.1-2

for you to fetch changes up to a6848a50404eefb6f0b131c21881a2d8d21b31a9:

  firmware: arm_ffa: Fix sched-recv callback partition lookup (2026-05-05 16:42:49 +0100)

----------------------------------------------------------------
Arm FF-A fixes for v7.1

The updates fix several robustness issues in the FF-A bus and core driver,
mostly around notification handling, RxTx buffer sizing, firmware-provided
bounds, and cleanup paths.

The notification fixes make per-CPU notification work truly per-CPU, avoid
running per-vCPU notification handling from IPI context, keep RX buffer
release serialized under rx_lock, validate framework notification payload
layout before copying from the shared RX buffer, and avoid dereferencing
notifier entries after they may have been unregistered.

The remaining fixes reject FF-A drivers without an ID table at registration
time, avoid freeing an unallocated RX buffer after allocation failure,
unregister the FF-A v1.0 bus notifier on teardown, bound register-based
PARTITION_INFO_GET descriptor copies, align the stored RxTx buffer size with
the size mapped to firmware, and fix sched-recv callback partition lookup on
the circular partition list.

----------------------------------------------------------------
Sudeep Holla (11):
      firmware: arm_ffa: Check for NULL FF-A ID table while driver registration
      firmware: arm_ffa: Skip free_pages on RX buffer alloc failure
      firmware: arm_ffa: Avoid collapsing NPI work from different CPUs
      firmware: arm_ffa: Fix per-vcpu self notifications handling in workqueue
      firmware: arm_ffa: Unregister bus notifier on teardown for FF-A v1.0
      firmware: arm_ffa: Bound PARTITION_INFO_GET_REGS copies
      firmware: arm_ffa: Keep framework RX release under lock
      firmware: arm_ffa: Validate framework notification message layout
      firmware: arm_ffa: Align RxTx buffer size before mapping
      firmware: arm_ffa: Snapshot notifier callbacks under lock
      firmware: arm_ffa: Fix sched-recv callback partition lookup

 drivers/firmware/arm_ffa/bus.c    |   4 +-
 drivers/firmware/arm_ffa/driver.c | 144 ++++++++++++++++++++++++++------------
 2 files changed, 104 insertions(+), 44 deletions(-)
