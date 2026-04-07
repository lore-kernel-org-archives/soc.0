Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E692F532F
	for <soc@lists.linux.dev>; Tue,  7 Apr 2026 10:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775556527; cv=none; b=YdFbS6YfeZXCnkQaaKjh1LUMCJl4S9OI3n4hRvNayKWMCs32CdnjGW2JlCY9cWz7DXhsZ5LKWxC/L23EO0IRnQKzMyKYTWvv0KfSA0vsK/iYMmRmyhPphCevy6nK5P4ogYvzTNmJfANRGcy7LWkNCojRK8VYoVeBJAwVU93j9/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775556527; c=relaxed/simple;
	bh=6J/dMth4Df+CbjL8W8F+sqSp1uVURDezELTXVv5pzk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NmjPwJBjpYwxPUtZDdf+Sj7BYcFrFkSitDoxkYa0QsWSAjC6BE8ELBFAu1f8IqpYvsKinQqUAR+eV8wDVZCBR6L0BhTABLgR0GExksAKGp6Y7p0hGSmgn4pNAj/f7pz0hh/Vn3dmklWsBwFRf6DinRivkDdMUfJN1bO1zoq/slI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SvEW8qNl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SvEW8qNl"
Received: by smtp.kernel.org (Postfix)
	id 36111C2BCB0; Tue,  7 Apr 2026 10:08:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25AD4C116C6;
	Tue,  7 Apr 2026 10:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775556527;
	bh=6J/dMth4Df+CbjL8W8F+sqSp1uVURDezELTXVv5pzk0=;
	h=From:To:Cc:Subject:Date:From;
	b=SvEW8qNl2VNjZyOY37TaXthP5bbVVW+RRDGA/LHf4FnZ5b8zL+jsgTruo4RFIUITQ
	 vpEN+O4S2v+rlTQj14Ab4SORwZGhUHq81bS6nJYdXfZQcQuCbKYdtZAsMqdXpp/y8G
	 igBDHVKbRqGUFD2v66eXXl5XI1chV36pOmMNdLd7dq8pQ2y2GyIXT9rqV2m2gGoCIl
	 2GR+pNQ4HKeAfMTtCGQlpSlEIKgRi16wHCwdOKc/F/mn1eux8gLKeqTQKM128glOYx
	 P2Z7KyQiuH/JkVDlRgWWFeWXtojyswmq2Y8tMjhRhJFmNxMvUvauq4LUYjGME7E6ZT
	 ah//8nBznRR+Q==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>
Subject: [GIT PULL] firmware: arm_ffa: Fix for v7.1
Date: Tue,  7 Apr 2026 11:08:39 +0100
Message-ID: <20260407100841.3150090-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull ! This is the only fix/update I have at the moment for v7.1
So, I am sending it early as fix but late as an update for v7.1.

Regards,
Sudeep

-->8

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fix-7.1

for you to fetch changes up to 83210251fd70d5f96bcdc8911e15f7411a6b2463:

  firmware: arm_ffa: Use the correct buffer size during RXTX_MAP (2026-04-07 10:47:42 +0100)

----------------------------------------------------------------
Arm FF-A fix for v7.1

Use the page aligned backing allocation size when computing the RXTX_MAP
page count. This fixes FF-A RX/TX buffer registration on kernels built
with 16K/64K PAGE_SIZE, where alloc_pages_exact() backs the buffer with a
larger aligned span than the discovered minimum buffer size.

----------------------------------------------------------------
Sebastian Ene (1):
      firmware: arm_ffa: Use the correct buffer size during RXTX_MAP

 drivers/firmware/arm_ffa/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
