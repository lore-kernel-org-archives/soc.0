Return-Path: <SRS0=sj+x=DO=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A678EC001DE
	for <soc@archiver.kernel.org>; Fri, 28 Jul 2023 09:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7019FC433CA; Fri, 28 Jul 2023 09:41:36 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 80BFFC433C7;
	Fri, 28 Jul 2023 09:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 80BFFC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-52256241c50so2750984a12.3;
        Fri, 28 Jul 2023 02:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690537293; x=1691142093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E3R4wjBnDBMtOFENnE25FnGBV6r3mcWK08y5v73y74o=;
        b=rqARx47UfymMOYmczBXyKBnvWA0E2hC+5Dah5oW3rOCSMSmhd6Y49Y6f+E6u83ZxXm
         2vRj+AN93RZ1WnpAwDUXECvBF1Q4jYyv0B+I7XD4/9Wtirp2g5eyG4tWWijoar0gJazF
         8iTsaL86sOBbj5mEkUmPRIvaIpNCgMyiCaDAzscy2U5GnCCAD8yf8/mVgKSgal3Co9hI
         7UTLFgI2iVr1hALUKPuyFjFy6iY3hyIhXakNjT+SefSXggdT8sK9qahS5jAmmDWwHxm5
         PPjejlGjmn3hWPbb92wvbEBXQwdqdCjQMZnRfdx9+XzZuK9yD1v5wvmjxnpkpbb13HEH
         yx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690537293; x=1691142093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3R4wjBnDBMtOFENnE25FnGBV6r3mcWK08y5v73y74o=;
        b=WdWqxjGuMrm12ehEmjwB4vUs7WzfbkyDjzmq7zUvWGFkfmlfboUyRTOEGJf7lu7OJh
         51MXMOAVRAXf7MlTUv2Id39hR1gvtsOEtiQqggzIqrOgOw+2BZaVX9F9Wb/oVTdyy/vg
         hzxEDKi1TV8q1uoYOvwsKRWssRSEElmJ8tAViCwg8J8ZzxmFHYaAI4FQEXz+xtAD9ncY
         EPBT++uIlJegnO94I+IFxqbmjTg3xsoHxNqUn9z1PTS0DNbo4N9Ge9OuxISNgtbdBdKN
         JLZpEuyKPC6hXy6UEqWq8b9Zx38xZ7q1PnbiS2PwCJwSfIbjtEEXQ3azHo+t7eI8dDPF
         Vkpw==
X-Gm-Message-State: ABy/qLYcrkdhFzluSEFHz1UmB2Z+IMI38CoGHHQnp2rnFyzFfvKiUDlo
	PQzIv37+T9d7Px0ps2GWYCyxVxrDoHs=
X-Google-Smtp-Source: APBJJlEDOX6YqWMymx/XeVyFp1/FBsxAmn1xCe5AQCPwQYymOBAKKg/VrTTWbk2IsdMQ7Uq2tQkVpA==
X-Received: by 2002:a05:6402:10c1:b0:522:200f:cc50 with SMTP id p1-20020a05640210c100b00522200fcc50mr1795924edu.19.1690537292887;
        Fri, 28 Jul 2023 02:41:32 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id u19-20020aa7d993000000b005222aee9ef9sm1567322eds.97.2023.07.28.02.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 02:41:32 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/4] soc/tegra: Changes for v6.6-rc1
Date: Fri, 28 Jul 2023 11:41:25 +0200
Message-ID: <20230728094129.3587109-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.6-soc

for you to fetch changes up to 10f975f8b0e8e563bf1e5c2f5e4ebada29fa7edc:

  soc/tegra: cbb: Remove unnecessary print function dev_err() (2023-07-27 18:46:37 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.6-rc1

This contains a selection of minor cleanups.

----------------------------------------------------------------
Jiapeng Chong (1):
      soc/tegra: cbb: Remove unnecessary print function dev_err()

Rob Herring (1):
      soc/tegra: Explicitly include correct DT includes

Thierry Reding (1):
      soc/tegra: fuse: Sort includes alphabetically

Yangtao Li (2):
      soc/tegra: fuse: Use devm_platform_get_and_ioremap_resource()
      bus: tegra-gmi: Convert to devm_platform_ioremap_resource()

 drivers/bus/tegra-gmi.c                |  4 +---
 drivers/soc/tegra/cbb/tegra-cbb.c      | 12 ++----------
 drivers/soc/tegra/cbb/tegra194-cbb.c   |  4 +---
 drivers/soc/tegra/cbb/tegra234-cbb.c   |  3 ---
 drivers/soc/tegra/fuse/fuse-tegra.c    |  9 +++------
 drivers/soc/tegra/fuse/fuse-tegra20.c  |  2 +-
 drivers/soc/tegra/fuse/fuse-tegra30.c  |  2 --
 drivers/soc/tegra/fuse/tegra-apbmisc.c |  4 ++--
 8 files changed, 10 insertions(+), 30 deletions(-)
