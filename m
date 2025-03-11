Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BBF1E3DFA
	for <soc@lists.linux.dev>; Tue, 11 Mar 2025 02:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741659911; cv=none; b=gxRDM1H8WdqafYjjWJ0TGdJ2RDQ9AwGMTrxHP/9X1N/GlN5bU7NWPtt8wzGgXWfxao99iSW8fAGJGef1TZfvs03wsthIB5P9SPEHG0f3KXoJSRJI41lkM1bz1ZTHQbQOI2MyLx08fy9sWDCowFTrztKdoGXbUBUpcPSf9LNDei0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741659911; c=relaxed/simple;
	bh=FPCsEDlVAiktsTcXMIq1mYcVDLwa2IUEjTMcsNbQMG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pzTLMQ0IBNOVW5vUmuMHGudL4NfM5Cm+j4Tgtp1biC9P2qApKeTbtcbdbRHYnmw9aCSC5lqF6iup0JlX0Wo1ss6NiWRQ6+NsTrIbGVFSTWSrXhyan8zOJCcGmCUTVkW4uOk9sIPPzCyFA6Gwt67dXM1VAr0lvhYl7A7jKZfhxt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNeWMBQ2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNeWMBQ2"
Received: by smtp.kernel.org (Postfix)
	id 591D0C4CEEE; Tue, 11 Mar 2025 02:25:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DEE0C4CEE5;
	Tue, 11 Mar 2025 02:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741659911;
	bh=FPCsEDlVAiktsTcXMIq1mYcVDLwa2IUEjTMcsNbQMG8=;
	h=From:To:Cc:Subject:Date:From;
	b=KNeWMBQ2U3y/U0qjJixEPYha9AlBauhhku0+qOqr3Gb+4g/rxxteqZcLPCdnZ7wkW
	 SCnqKr1nFpOulihgeaa7rgGroSreftX9dwsiNLTzWtNWQw7FqQnGZn660PXKqnD9/7
	 NwtcksgbRF2W+g8TsHTzwvVWWhdFE8ATfD8nTeLMjaimth6hI7OLTm3jeE1i9t/NDO
	 ZVkD0sc+k6lT9H8Uelg7rBVvTgCRCcKUx2mZoO3uE4ftwizj67aNHFlamwOEeW66CN
	 9vA6HLe7O8GVtUKGMLCbeoC+MYjgOib1OjEoGYkxJnH7TcKpLne2MLAeITpLwOnVGL
	 A5/tMJE4EFEUg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Saranya R <quic_sarar@quicinc.com>
Subject: [GIT PULL] Qualcomm driver fixes for v6.14
Date: Mon, 10 Mar 2025 21:25:08 -0500
Message-ID: <20250311022509.1232678-1-andersson@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-6.14

for you to fetch changes up to 2eeb03ad9f42dfece63051be2400af487ddb96d2:

  soc: qcom: pdr: Fix the potential deadlock (2025-02-14 09:16:27 -0600)

----------------------------------------------------------------
Qualcomm driver fixes for v6.14

Fixes a locking issue in the PDR implementation, which manifest itself
as transaction timeouts during the startup procedure for some
remoteprocs.

A registration race is fixed in the custom efivars implementation,
resolving reported NULL pointer dereferences.

Error handling related to tzmem allocation is corrected, to ensure that
the allocation error is propagated.

Lastly a trivial merge mistake in pmic_glink is addressed.

----------------------------------------------------------------
Dan Carpenter (1):
      firmware: qcom: scm: Fix error code in probe()

Johan Hovold (1):
      firmware: qcom: uefisecapp: fix efivars registration race

Krzysztof Kozlowski (1):
      soc: qcom: pmic_glink: Drop redundant pg assignment before taking lock

Saranya R (1):
      soc: qcom: pdr: Fix the potential deadlock

 drivers/firmware/qcom/qcom_qseecom_uefisecapp.c | 18 +++++++++---------
 drivers/firmware/qcom/qcom_scm.c                |  4 ++--
 drivers/soc/qcom/pdr_interface.c                |  8 +-------
 drivers/soc/qcom/pmic_glink.c                   |  2 +-
 4 files changed, 13 insertions(+), 19 deletions(-)
