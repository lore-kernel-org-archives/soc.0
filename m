Return-Path: <SRS0=I4J+=3S=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD61C4332F
	for <soc@archiver.kernel.org>; Fri, 18 Nov 2022 21:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 32130C433B5; Fri, 18 Nov 2022 21:11:05 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A4864C433D6;
	Fri, 18 Nov 2022 21:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A4864C433D6
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-13be3ef361dso7346141fac.12;
        Fri, 18 Nov 2022 13:11:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pTSfBoYqlZy8UzseJyxona1/vxw6WXJ/7Y2pdy6m35g=;
        b=wfk8I1yJmq9m2+s4Ld0l0FndsPlDzV90jCQq4DCvR67kPKLHzhK9snmUy/Cz5vpiG3
         LZTKOJ/+VrnnyIZBJtukXTq8c9SWEtQvmdjQ52X9En5CjLF2wgO8WSmMCuUhaX7WNK76
         gvGJRzlhTNuwqH3TkRex+A9bbYIIl8rOMN1Zop7Fu5V9ur6tCumpcHroZR48iPLDVA4r
         1ku+WpoyRXQBhJYBQjtneJDwP2lhdvHMIqUWADlON/gUFp4BwfmBxZc8u31knVlgKb5U
         6heJBXHbv9pLluiiOLqeUzRvUf8mRyxN2sxXXu2ju3jJ6zKt1UCmSci9l/tkjdCqGdmZ
         F7qw==
X-Gm-Message-State: ANoB5pna/IEBUAuJ4k9tBcJsiL4IeQKz3Vjq1MEJHkfFUEIkJxtBr/5a
	j1kXVH1NOPilE50m9TnfIlM6ZQU5NA==
X-Google-Smtp-Source: AA0mqf68SULkJkvPwdY31SVk4/OZ4isXEHSxTZZ2Q18Zv4Z7kl4qjnt1WNW+Q8GAKb+mHa+a208hLA==
X-Received: by 2002:a05:6870:ac07:b0:13e:bdf2:3e6c with SMTP id kw7-20020a056870ac0700b0013ebdf23e6cmr8033477oab.45.1668805862102;
        Fri, 18 Nov 2022 13:11:02 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p128-20020aca5b86000000b0035a5b95bd38sm1814944oib.54.2022.11.18.13.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 13:11:01 -0800 (PST)
Received: (nullmailer pid 1359966 invoked by uid 1000);
	Fri, 18 Nov 2022 21:11:03 -0000
Date: Fri, 18 Nov 2022 15:11:03 -0600
From: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Davis <afd@ti.com>, Michal Simek <michal.simek@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, Frank Wunderlich <linux@fw-web.de>
Subject: [GIT PULL] Stable branch for .dts to .dtso rename
Message-ID: <20221118211103.GA1334449-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

.dts files for overlays are getting renamed to .dtso. The kbuild support 
for that in in this stable branch. The .dts patches that depend on this 
are here[1]. There's also some new .dts overlay files posted[2].

I'll leave it to the SoC and sub-arch maintainers to decide how you all 
want to handle it from here. Either SoC maintainers can take this branch 
and dependent rename patches or each sub-arch can. In any case, I would 
like it converted over in 6.2 so we can remove .dts -> .dtbo build 
support ASAP and not be carrying both.

Rob

[1] https://lore.kernel.org/all/20221024173434.32518-1-afd@ti.com/
[2] https://lore.kernel.org/all/20221118190126.100895-12-linux@fw-web.de/

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/dtbo-rename

for you to fetch changes up to dcad240c15c10bebdccd1f29f1a44787528f2d76:

  kbuild: Cleanup DT Overlay intermediate files as appropriate (2022-11-18 14:45:30 -0600)

----------------------------------------------------------------
Andrew Davis (4):
      kbuild: Allow DTB overlays to built from .dtso named source files
      kbuild: Allow DTB overlays to built into .dtbo.S files
      staging: pi433: overlay: Rename overlay source file from .dts to .dtso
      kbuild: Cleanup DT Overlay intermediate files as appropriate

Frank Rowand (1):
      of: overlay: rename overlay source files from .dts to .dtso

 .gitignore                                         |  1 +
 Makefile                                           |  4 +-
 drivers/of/unittest-data/Makefile                  | 66 +++++++++++-----------
 .../of/unittest-data/{overlay.dts => overlay.dtso} |  0
 .../{overlay_0.dts => overlay_0.dtso}              |  0
 .../{overlay_1.dts => overlay_1.dtso}              |  0
 .../{overlay_10.dts => overlay_10.dtso}            |  0
 .../{overlay_11.dts => overlay_11.dtso}            |  0
 .../{overlay_12.dts => overlay_12.dtso}            |  0
 .../{overlay_13.dts => overlay_13.dtso}            |  0
 .../{overlay_15.dts => overlay_15.dtso}            |  0
 .../{overlay_16.dts => overlay_16.dtso}            |  0
 .../{overlay_17.dts => overlay_17.dtso}            |  0
 .../{overlay_18.dts => overlay_18.dtso}            |  0
 .../{overlay_19.dts => overlay_19.dtso}            |  0
 .../{overlay_2.dts => overlay_2.dtso}              |  0
 .../{overlay_20.dts => overlay_20.dtso}            |  0
 .../{overlay_3.dts => overlay_3.dtso}              |  0
 .../{overlay_4.dts => overlay_4.dtso}              |  0
 .../{overlay_5.dts => overlay_5.dtso}              |  0
 .../{overlay_6.dts => overlay_6.dtso}              |  0
 .../{overlay_7.dts => overlay_7.dtso}              |  0
 .../{overlay_8.dts => overlay_8.dtso}              |  0
 .../{overlay_9.dts => overlay_9.dtso}              |  0
 ..._dup_node.dts => overlay_bad_add_dup_node.dtso} |  0
 ..._dup_prop.dts => overlay_bad_add_dup_prop.dtso} |  0
 ...ay_bad_phandle.dts => overlay_bad_phandle.dtso} |  0
 ...rlay_bad_symbol.dts => overlay_bad_symbol.dtso} |  0
 .../{overlay_base.dts => overlay_base.dtso}        |  0
 .../{overlay_gpio_01.dts => overlay_gpio_01.dtso}  |  0
 ...{overlay_gpio_02a.dts => overlay_gpio_02a.dtso} |  0
 ...{overlay_gpio_02b.dts => overlay_gpio_02b.dtso} |  0
 .../{overlay_gpio_03.dts => overlay_gpio_03.dtso}  |  0
 ...{overlay_gpio_04a.dts => overlay_gpio_04a.dtso} |  0
 ...{overlay_gpio_04b.dts => overlay_gpio_04b.dtso} |  0
 .../{testcases.dts => testcases.dtso}              |  0
 drivers/of/unittest.c                              | 48 ++++++++--------
 .../{pi433-overlay.dts => pi433-overlay.dtso}      |  0
 .../pi433/Documentation/devicetree/pi433.txt       |  6 +-
 scripts/Makefile.build                             |  2 +
 scripts/Makefile.lib                               | 23 +++++++-
 41 files changed, 88 insertions(+), 62 deletions(-)
 rename drivers/of/unittest-data/{overlay.dts => overlay.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_0.dts => overlay_0.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_1.dts => overlay_1.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_10.dts => overlay_10.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_11.dts => overlay_11.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_12.dts => overlay_12.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_13.dts => overlay_13.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_15.dts => overlay_15.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_16.dts => overlay_16.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_17.dts => overlay_17.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_18.dts => overlay_18.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_19.dts => overlay_19.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_2.dts => overlay_2.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_20.dts => overlay_20.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_3.dts => overlay_3.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_4.dts => overlay_4.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_5.dts => overlay_5.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_6.dts => overlay_6.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_7.dts => overlay_7.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_8.dts => overlay_8.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_9.dts => overlay_9.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_bad_add_dup_node.dts => overlay_bad_add_dup_node.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_bad_add_dup_prop.dts => overlay_bad_add_dup_prop.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_bad_phandle.dts => overlay_bad_phandle.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_bad_symbol.dts => overlay_bad_symbol.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_base.dts => overlay_base.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_gpio_01.dts => overlay_gpio_01.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_gpio_02a.dts => overlay_gpio_02a.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_gpio_02b.dts => overlay_gpio_02b.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_gpio_03.dts => overlay_gpio_03.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_gpio_04a.dts => overlay_gpio_04a.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_gpio_04b.dts => overlay_gpio_04b.dtso} (100%)
 rename drivers/of/unittest-data/{testcases.dts => testcases.dtso} (100%)
 rename drivers/staging/pi433/Documentation/devicetree/{pi433-overlay.dts => pi433-overlay.dtso} (100%)
