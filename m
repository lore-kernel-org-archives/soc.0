Return-Path: <SRS0=ubxS=ER=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2384CA0FE6
	for <soc@archiver.kernel.org>; Fri,  1 Sep 2023 10:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9EDCDC433CB; Fri,  1 Sep 2023 10:17:51 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C00BEC433C9;
	Fri,  1 Sep 2023 10:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C00BEC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2bcb89b4767so29663941fa.3;
        Fri, 01 Sep 2023 03:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693563468; x=1694168268; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nYg8l6Jyfp1iBKfTo4myl31mihhTTXccbSjg7R4uzxI=;
        b=Wyc09Bn6QXpbbXqaCPr8Vtcv+dnHLIlT+RKxDJ80oGob6x0QmJ9kc1Z05JZGOQRl9X
         XIXqdvUPrWvJFSoENJ6vnwfhce8vIC2uA0WF5X9ZAlHxHD6ZxY8wWFTk3KMvYbfMfoxP
         krtNjRx7QKvwQqvlVC5PKNccrIaHidE4dfrgJsm2di8sz/feiCos2SSXHpGJl+niEBJw
         h6j/dPJSvILmnP9H4oTIwhPTJk06sZf/E4Q4nDaZlZHFw8zVWWIrmEeVDc87Ud0y/ZLo
         DAsUP6P974a/C095HmPUpC7sc1WiMpf7RGf8ulVBx9hoM66cfV6q2kL4+PofpQjweMxW
         04xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693563468; x=1694168268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYg8l6Jyfp1iBKfTo4myl31mihhTTXccbSjg7R4uzxI=;
        b=X+NAnYq4AwflD0ibr6I82juKU3NE0Rhe3Ipw5xbx/T86gHig/eOaJ1BhUVBNuIyXpg
         8IEz+pRblWkbcvKZQs7ncML1B32jy+2V7NUDhGTNxZRr2zOe7H7lUw6j7SGVrt/ffz68
         Mf1mNQqHgYQrmj08qMvT7ql4u6T6eK0p0doUTte3aRTeoIovCtbclpUBt99Bp91yCPDg
         OSiPXFnHebfy49DbpsP0NwwSDFiQek3LJwCYmkoB2FLkDyQrJ5fo85Ix36kZIRCwLojV
         A85Im0v3RgfbFM/nUMNbEHLsxxyA7TRYv0bIq5xRln1GTTVzlBz5Le1uDsnM8K7Hg0Xo
         pQFQ==
X-Gm-Message-State: AOJu0Yzd3nvodL4ArlwE3m9+jQH6yE0mzCGo5fVCUjKVK3KvT+ej2jlg
	6FiXQuzoM6DjteXhKWPMg1qbgTS1t6Q=
X-Google-Smtp-Source: AGHT+IFkAG3fG76w4qNUIzW19jbYrK07Oj1yWuRbsFhuuKlkDeLerwPOKJ01T068DSHKL5Z9R8w5uA==
X-Received: by 2002:a19:2d17:0:b0:500:9a45:636 with SMTP id k23-20020a192d17000000b005009a450636mr1157658lfj.13.1693563466598;
        Fri, 01 Sep 2023 03:17:46 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id bo9-20020a0564020b2900b0052889d090bfsm1876647edb.79.2023.09.01.03.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 03:17:46 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2 1/2] dt-bindings: Changes for v6.6-rc1
Date: Fri,  1 Sep 2023 12:17:40 +0200
Message-ID: <20230901101742.1871434-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 72738fdeccd172210539a786e23b09b67565d509:

  dt-bindings: firmware: Add support for tegra186-bpmp DRAM MRQ GSCs (2023-07-26 18:23:42 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.6-dt-bindings-v2

for you to fetch changes up to 9d697e4b743080f560e3eee54599853e8ee8fa25:

  dt-bindings: arm: tegra: pmc: Relicense and move into soc/tegra directory (2023-08-16 18:19:53 +0200)

As discussed previously, here are some late updates for the Tegra tree.

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.6-rc1

This the conversion of one more DT binding to json-schema.

----------------------------------------------------------------
Thierry Reding (7):
      dt-bindings: arm: tegra: pmc: Improve property descriptions
      dt-bindings: arm: tegra: pmc: Remove useless boilerplate descriptions
      dt-bindings: arm: tegra: pmc: Move additionalProperties
      dt-bindings: arm: tegra: pmc: Increase maximum number of clocks per powergate
      dt-bindings: arm: tegra: pmc: Restructure pad configuration node schema
      dt-bindings: arm: tegra: pmc: Reformat example
      dt-bindings: arm: tegra: pmc: Relicense and move into soc/tegra directory

 .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml     | 393 -------------------
 .../bindings/soc/tegra/nvidia,tegra20-pmc.yaml     | 416 +++++++++++++++++++++
 2 files changed, 416 insertions(+), 393 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml
