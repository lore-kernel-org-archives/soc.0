Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4C73290C3
	for <soc@lists.linux.dev>; Mon,  6 Apr 2026 13:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775481701; cv=none; b=sg7hj09A2pvfD+4IBirw44GoZPBv1vQmrJEi2AqSkYLKGTQPYebjnYIsK40QoxXAmJBvwQvKHbM0gUTAwU7qfNr2TC6QXsvqV2kO5B6Dri0v339DTBreIEYKTD3vAPFArx9ZqHyq/6OGLgsy8rgDgQBMox/i8Zg73f1cvdd0ahI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775481701; c=relaxed/simple;
	bh=gMzvZgJhPQDGhuIKuU+VTQeMpr2RvuGJOM4ZILaIqFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qkj3/ckFHlJMB9JQZgDF7KxEKWaTGbQfxorfKnbiksmXZ+vEk02+sss7Fe3ooEGwbcBDku8IipByxzyyfzd75vnp3Pl37yibAFahyy4FJHkcPYBwgGnVLpX8msZRXPhdPZnCrGxEDBJWSVEnrphDqKjOKy7zJsqyt6KhzEM5Nw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fsgW6wgG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fsgW6wgG"
Received: by smtp.kernel.org (Postfix)
	id 892ADC2BCB1; Mon,  6 Apr 2026 13:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5CB9C4CEF7;
	Mon,  6 Apr 2026 13:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775481701;
	bh=gMzvZgJhPQDGhuIKuU+VTQeMpr2RvuGJOM4ZILaIqFM=;
	h=From:To:Cc:Subject:Date:From;
	b=fsgW6wgGxQgAydwtbIDhTk+P+JSilrn1Tax8ZmMrcV+Lk2Pca7Vwn6KzcjoppNSBo
	 +z15AhJqxG4SvBN8legbu7ORAtxK+8tvlPnTKzS77w9pNmMsosqr2TkxXKQdSN5seZ
	 BHn3SYsmIKXRrUJ+GBSlqB1dDjSJqUs29KHvbJOvbEmNzlHofD5zukbFBz80Tqj7Xu
	 cyUwAM+nFcSIcj63J8NRUy9ifU8PUfwHpbH+SOQXuJ0n5NFcvH0bKzoqgIV1WeUaGP
	 APnZ56ai67I5jUlkIAY54LXp5kfIZK3KX+0CUR1BBFtfOJf3Fm5UV2YIBoxnW10H+H
	 bDmrBaJslID/Q==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [GIT PULL] One more Qualcomm driver update for v7.1
Date: Mon,  6 Apr 2026 08:21:38 -0500
Message-ID: <20260406132138.2265013-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit d6e766e391ef0b2be62682e007223fc72ba7764f:

  Merge branch '20260125-iris-ubwc-v4-1-1ff30644ac81@oss.qualcomm.com' into drivers-for-7.1 (2026-03-30 12:46:14 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-7.1-2

for you to fetch changes up to a31ad9339eff4ce401dec816b01a94b4e3c47898:

  firmware: qcom: scm: Allow QSEECOM on Lenovo IdeaCentre Mini X (2026-04-02 16:09:01 -0500)

----------------------------------------------------------------
One more Qualcomm driver update for v7.1

Flag Lenovo IdeaCentre Mini X to have functional QSEECOM/uefisecapp.

----------------------------------------------------------------
Bjorn Andersson (1):
      firmware: qcom: scm: Allow QSEECOM on Lenovo IdeaCentre Mini X

 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)
