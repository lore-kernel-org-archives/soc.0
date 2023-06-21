Return-Path: <SRS0=dnHX=CJ=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58B9EB64D7
	for <soc@archiver.kernel.org>; Wed, 21 Jun 2023 03:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0B0EC433C8; Wed, 21 Jun 2023 03:16:14 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A24C4C433C0;
	Wed, 21 Jun 2023 03:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A24C4C433C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b516978829so43562805ad.1;
        Tue, 20 Jun 2023 20:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687317372; x=1689909372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7nB6R0ouDG8zHyz3+Z8AEZ2eoEA3QO4GpFCpSBeZ10g=;
        b=iCO3ku+Uhm6rlxOnDEhVNOLzuI4wQF4xrBGC+dvhpnMwUtSbewBEWazsqWS4pg3gTb
         xKWj4eO3LtyZxjaxEOgUrHqu/oS29qzD40oBn9L0Lq2rVZfV/9RUP0u5M2u1xK9AURqb
         rBdWju/6G9Gpyn5RAJrD1QpIiy7HDpgFx+km7MUgd+2ezcKxGYZV92sVS2IQUGSoXQFT
         swwWLWVUbQQJEB//eYUPhKozDoqqh5bXbxDjtnnVAg6lfIc553Cy5SBMlMi5wM8JBA1p
         Cdg+9t3lEe9dkWMDudaDGpCDIE3RJic0DU+tDi/CZ4XBfRZq9R3jePj18RlMrThCng4N
         MVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687317372; x=1689909372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7nB6R0ouDG8zHyz3+Z8AEZ2eoEA3QO4GpFCpSBeZ10g=;
        b=bhEdKEMXfjG5FCnO06OWnNd7ann021qR3Ydkl4RT07Nw6dpOEzjo/8eCyPxRK5USp/
         CNCiY10sTf/mEcm2lyqvde5CVDt/SeoU8EewXaEvc/9/DY8Re/FmP/tX3wvFsyBHacAG
         iaVGgbn6IrnYPtBisnDJDABRsSu4NObPGylR9yAbYQXMJWt8USKIUHGJlWaHUF38Tfbk
         nHukUcldRNKr/PAaxfWQn3OOkwUrOheainWlY15GCwpNK5JlaV44olyINqP5vBwSAOQu
         6XRuPN49jIfAHhzeDg2TGFdqcQAxbkoeIPzYi1ymsLGNkHtdMlcWNvDgCWt82+gKVHgv
         WOXw==
X-Gm-Message-State: AC+VfDzKVy4T6OXViDLhsN2P9xGIkPjt6HIrn9LeDGUfeFrtw5nOdggk
	rJ54Gtqy9NVgZS1vqw6bZMI=
X-Google-Smtp-Source: ACHHUZ4UcsTpEvDFFd3DyltwlAJiswPaNd58ZXIHCY/uOaxB0kW+EmvrOngR2fOsSwWb49PYi6r/Lg==
X-Received: by 2002:a17:902:ea0f:b0:1b6:6b03:10cd with SMTP id s15-20020a170902ea0f00b001b66b0310cdmr6482846plg.67.1687317371780;
        Tue, 20 Jun 2023 20:16:11 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id w13-20020a170902d3cd00b001b01fc7337csm2257747plb.247.2023.06.20.20.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 20:16:11 -0700 (PDT)
From: Jacky Huang <ychuang570808@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	soc@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	schung@nuvoton.com,
	Jacky Huang <ychuang3@nuvoton.com>
Subject: [PATCH v2 0/2] clk: nuvoton: Use clk_parent_data instead and add a header file
Date: Wed, 21 Jun 2023 03:16:03 +0000
Message-Id: <20230621031605.234149-1-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacky Huang <ychuang3@nuvoton.com>

This set of patches addresses some of the issues that were identified in
the ma35d1 clock driver.

1. The external functions referenced between the .c files in this driver
   should not be declared within the .c files themselves. Instead, a shared
   .h file should be created to reference them.

2. For the declaration of parent clocks, use struct clk_parent_data instead
   of a string. Due to the change in the passed arguments, replace the usage
   of devm_clk_hw_register_mux() with clk_hw_register_mux_parent_data() for
   all cases.

v2:
  - In v1, all these modifications were included in a single patch, which is
    not ideal. In v2, there were no changes made to the patch content itself,
    but the different modification topics were separated into two individual
    patches 


Jacky Huang (2):
  clk: nuvoton: Add clk-ma35d1.h for driver extern functions
  clk: nuvoton: Use clk_parent_data instead of string for parent clock

 drivers/clk/nuvoton/clk-ma35d1-divider.c |   7 +-
 drivers/clk/nuvoton/clk-ma35d1-pll.c     |   5 +-
 drivers/clk/nuvoton/clk-ma35d1.c         | 737 +++++++++++++----------
 drivers/clk/nuvoton/clk-ma35d1.h         |  18 +
 4 files changed, 447 insertions(+), 320 deletions(-)
 create mode 100644 drivers/clk/nuvoton/clk-ma35d1.h

-- 
2.34.1

