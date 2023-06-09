Return-Path: <SRS0=ktnR=B5=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7A9C7EE29
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 19:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AE442C4339B; Fri,  9 Jun 2023 19:36:30 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CBE1AC433D2;
	Fri,  9 Jun 2023 19:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CBE1AC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-51458e3af68so3664083a12.2;
        Fri, 09 Jun 2023 12:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686339387; x=1688931387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqt4+ldB36U6xUlL2P3+WilBRNY/yfoNAfD8ECtvKv8=;
        b=KxkRdy7zWG6PkO+HLfwXa5oQ8uG/V+rXVxD1ShMYAWiADkaDefyAa/anT3cS5ql5zg
         2dcklywBbrNWXRBSTH0mmkeOCtb2UQhgHO1MPYNeGMB/9sr38rLReRz+tKNiVrjgZMMw
         e6uiF780Tbg2F8Yqi2BMMI68cbEu9jwSp2GO/uAlNeFiS1UuHnxb4Pbj8XLAX3eteqlp
         Xx2ixMYWVx7HHJ906dHkUMiCcw3dBcMDNqYmURqG+Yf5cZj6RizrLlQaxeVYa+bJfeCR
         SnACMp5r+RJxyhq5GKNXmrpBQI2l76BVOybsHjQzswk8x0zpm/LzVaEZ8zKJCP6jmD2B
         Y8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686339387; x=1688931387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sqt4+ldB36U6xUlL2P3+WilBRNY/yfoNAfD8ECtvKv8=;
        b=cAwRFPaVGcocqw0jXtZFfXpk3G6zp2t34QDLkJL0tRUFWxZ6qUcEiD3nY83RwV7da+
         pDVeYrLYD5/Id31q4UIL9Xrl4yUeJ43R7WW7pggrokxcAs9L+y9FTFXPi9nKtgyoc0+3
         0qVE5C2zL44rI71zTSjYYTRznVkrQJ4KIobE4hHzXECdo48zWkqqKtIdw1LJ06JSbIfJ
         uNi6NnMUGShADD6hORu/Fjo1Ce+3l56DJh3UL75NNNR19dAcYxlPO3B1Lxc7avSUAKA9
         NYqw6q69Nf1gEOfEBElDXY1J76YP6Dzcwmi97/f83QRBn7R4s68GQOyVtwbw/Go/HpTK
         E7mw==
X-Gm-Message-State: AC+VfDwrMf/0UZTpON5VfOp2gi/qBDGZgLIvPDYh6gWU+htpQpGow7R5
	gc2fsSAK3B3Pyyy84aIxVhGBU4rHCec=
X-Google-Smtp-Source: ACHHUZ5cNYsyo0Pael7g5Cr+ko0Z0jRFoiI+oDoV5n0zWzreUXeeehUEh2ubIeqbNmXmTnANCQC6HA==
X-Received: by 2002:a50:fb12:0:b0:514:9df0:e3f3 with SMTP id d18-20020a50fb12000000b005149df0e3f3mr2355840edq.0.1686339387602;
        Fri, 09 Jun 2023 12:36:27 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ca15-20020aa7cd6f000000b00514a5f7a145sm2075693edb.37.2023.06.09.12.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 12:36:27 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] firmware: tegra: Changes for v6.5-rc1
Date: Fri,  9 Jun 2023 21:36:16 +0200
Message-Id: <20230609193620.2275240-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609193620.2275240-1-thierry.reding@gmail.com>
References: <20230609193620.2275240-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.5-firmware

for you to fetch changes up to 2abd484ca48f2e160c8d9c7241627c34855b621e:

  firmware: tegra: bpmp: Add support for DRAM MRQ GSCs (2023-06-09 17:17:23 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v6.5-rc1

This adds support for using system memory as shared memory between the
CPU and the BPMP, which will be needed for Tegra264 support.

----------------------------------------------------------------
Peter De Schrijver (1):
      firmware: tegra: bpmp: Add support for DRAM MRQ GSCs

 drivers/firmware/tegra/bpmp-tegra186.c | 204 +++++++++++++++++++++++----------
 drivers/firmware/tegra/bpmp.c          |   4 +-
 2 files changed, 147 insertions(+), 61 deletions(-)
