Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B74C77B7A
	for <soc@archiver.kernel.org>; Sat, 10 Jun 2023 07:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 66CC6C4339C; Sat, 10 Jun 2023 07:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74183C433EF;
	Sat, 10 Jun 2023 07:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686381955;
	bh=aSF6k520/gcxRjv71mYILEnns1RJpWMexLbiw2a9voI=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=SMCQJoN7d+1T+p7Kxqd5ucgL5xYS7gAiinCXVdkD5OYVlkJiFfOy3Q6aZs7/80Qip
	 KZEVeCMD5qj5Y6oeIDSxCkJLqaOE0N029wy1YH19za+KsouWMNj4Lkui94jyF6p3p0
	 eH5APS+R4kGRCInPO/g5mNqbAWG2t1XqbDtUm0Cat7+LDyPfXA3zeVpcf1xE0cHEpm
	 HB3y2tOduhFYTh2UM2iKJMfWD5ORLkLPHGEyWCZoBqMOjcmb5LY9U1zfZLUwcRJdN1
	 Id5YlizBqZUaJoVmSaCC0A9ovpXW73h0QM3PZvlcsDSazekAXdJ+0rNfyY0g1dTJFO
	 OvSw60UGJi5Tg==
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
Subject: [GIT PULL 1/4] i.MX dt-bindings for 6.5
Date: Sat, 10 Jun 2023 15:25:27 +0800
Message-Id: <20230610072530.418847-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.5

for you to fetch changes up to 50b1e9ece16c5fa680ae1c6fdc660b1f065e9b40:

  dt-bindings: arm: Add Gateworks i.MX8M GW7905-2x board (2023-05-27 18:58:48 +0800)

----------------------------------------------------------------
i.MX dt-bindings for 6.5:

- Add vendor prefix for Emtop
- Compatibles for Marantec Maveo Box, i.MX8MM-EVKB and GW7905-2x board.
- Replace tab indent with spaces in fsl.yaml.

----------------------------------------------------------------
Christoph Niedermaier (1):
      dt-bindings: arm: fsl: Add Marantec maveo box as a DHCOR i.MX6ULL SoM based board

Himanshu Bhavani (2):
      dt-bindings: arm: fsl: Add Emtop SoM & Baseboard
      dt-bindings: vendor-prefixes: Add Emtop

Johannes Schneider (1):
      dt-bindings: arm: fsl: Add i.MX8MM-EVKB

Marek Vasut (1):
      dt-bindings: arm: fsl: Fix syntax error

Tim Harvey (1):
      dt-bindings: arm: Add Gateworks i.MX8M GW7905-2x board

 Documentation/devicetree/bindings/arm/fsl.yaml         | 14 ++++++++++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml |  2 ++
 2 files changed, 16 insertions(+)
