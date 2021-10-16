Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D66C433F5
	for <soc@archiver.kernel.org>; Sat, 16 Oct 2021 14:02:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2F789611AF; Sat, 16 Oct 2021 14:02:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF01461245;
	Sat, 16 Oct 2021 14:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634392945;
	bh=II8m5phxUkggG0v6Cvmt5lfbgA98NX6PbBjQUG9i9Ig=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZbD/a1lJeYIYqVRR8J6h8p7FIpNi4KZfaDfzTacNg49nAagnbA4Knrf9krIcB39eE
	 /jzhbhGklk+EtMd8tsC8OBYDTCdf9W9BxMm/FaLurNWSHcfas4Tg54MUmIOxLtsq1c
	 qEoasIuzHf0HDBKtpUZ7C6yczEAaR8bu8JgzqDW53oeMSBQdRZOpusYSdD1WwT5TTE
	 vHvL6QLdBEXIt096MzRNowELiJGwe/E24YTbv5V/eVxYZHCMD3j4xdZDvINRSe3Xcg
	 j4UWei5hIjybZ5hVakB1jU8CILanvrrl+4woKS25RysVMfNVRZlMGhhU+DYrmCcmQa
	 5b5bygZoFadfA==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] i.MX maintainers update for 5.16
Date: Sat, 16 Oct 2021 22:01:38 +0800
Message-Id: <20211016140138.1603-6-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211016140138.1603-1-shawnguo@kernel.org>
References: <20211016140138.1603-1-shawnguo@kernel.org>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-maintainers-5.16

for you to fetch changes up to aa854c4aa715ab0ee76d537824f5abcd0a4120df:

  MAINTAINERS: add an entry for NXP S32G boards (2021-10-04 16:10:38 +0800)

----------------------------------------------------------------
i.MX maintainers update for 5.16:

- Add a new entry for the maintenance of NXP S32G device tree files.

----------------------------------------------------------------
Chester Lin (1):
      MAINTAINERS: add an entry for NXP S32G boards

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)
