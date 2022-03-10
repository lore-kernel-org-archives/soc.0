Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C41AC433FE
	for <soc@archiver.kernel.org>; Thu, 10 Mar 2022 19:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3516BC340F5; Thu, 10 Mar 2022 19:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEE76C340EC;
	Thu, 10 Mar 2022 19:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646942263;
	bh=scInkveJOndFN08vtRM7/nGfYeEgdpFfG/djvzQ3cIM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uHkE66mD3Vpr/msf9YaPQlAGLSGhv3qcIJfILNMxrsqPk4taWF1/+0dI4cnar+Tsa
	 U8BsAd7vVmU4NUBoW20wkw4t/m/KRhpL7sDOQZXe2VBNm2KKTGmzYfjx9YimB0KGFy
	 ZAaHNnxeXa9BTbLRKCbb1XpZ7yEIYHT+RDlpk22C638/4YdOl212RsE05JOSPiHUSz
	 XtG/amhAcQGZBca4Wqvpdn6BHEsKrXeTTDNykXbf3/L689bzCTAnQctYazGN+keqc5
	 C7ZJB0TBUtRCMWu5zCM8uVym++Yp7RNQhiSKQGP1LaH2WyWp3kXQFepD31tjX4SunY
	 tW03UVfQ1UrZQ==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL 2/2] arm64: defconfig: enable Altera FPGA Manager CVP driver
Date: Thu, 10 Mar 2022 13:57:40 -0600
Message-Id: <20220310195740.151250-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310195740.151250-1-dinguyen@kernel.org>
References: <20220310195740.151250-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/dinguyen/linux.git tags/arm64_defconfig_for_v5.18

for you to fetch changes up to a461cac0c4b4a0bf2f843561967906bb47d61e42:

  arm64: defconfig: enable the CVP driver (2022-03-01 10:01:59 -0600)

----------------------------------------------------------------
ARM64 defconfig for v5.18
- Enable the Altera FPGA Manager CVP driver

----------------------------------------------------------------
Dinh Nguyen (1):
      arm64: defconfig: enable the CVP driver

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
