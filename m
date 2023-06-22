Return-Path: <SRS0=0Aq4=CK=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2064EB64DD
	for <soc@archiver.kernel.org>; Thu, 22 Jun 2023 14:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4D9B8C433C9; Thu, 22 Jun 2023 14:13:52 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CDEC4C433CC;
	Thu, 22 Jun 2023 14:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CDEC4C433CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-517bdc9e81dso2959899a12.1;
        Thu, 22 Jun 2023 07:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687443229; x=1690035229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h6szGr6L3i5FMz3phg8XsP+aqzdYx92eWbT4G3zQDHo=;
        b=adR5ukuVOqtAHxCW1/2gcsyU8AcnMgeN0HpZwi2J9gVz4YE0wOy6BcJfG6nZc0eOaB
         czGVjDX6ndsY7QS5ZKegJZcn7Ln5qOcITnxgusUpMqq7Qly3s6V0iUw5nNlrWWJFt7JI
         Ff283Ji0FWpr6uLCtWsKbuIyxlIr65xcN9NKvgcG8SRi9DSjPrLCotnXFDa1pQLRRxdy
         Tp43/7YP+iG7c34E2CBf8qNDiBlVeNIYxbFYL+0WXPbWtSiOqqOOnfRxP9JMbMUF15MM
         30NlIRUtQqH0eKw7dNnd/Y8TZyu0+ChAnlI11TpoHRVlWRYwgAsZlt4J44h3kxjl1LIs
         EOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687443229; x=1690035229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h6szGr6L3i5FMz3phg8XsP+aqzdYx92eWbT4G3zQDHo=;
        b=biXzAK3vj+0MqOmmdPJAGMZln48zMdMMySslUrGaSp2cLxl72YdQvcMNlhTPfMPe5C
         qRETH843RNI5DYlLvKTTF7QooWpNGMcd0/LpkwYqxx9XJzvUGGQlvjnur90Rd3/8Lf19
         qE6IfJln/jjDEPWMVudn4/CQfsA8WFF/CQxn+hQ8vs9yA+ROisItWQ9QhmCEg2BhLt65
         h2yferTdhiKuTQQdzy7hgWH+PRgwc/+NNV1lZZ8cXT0JyRJrcjWbwYaHm1CG96b4yFym
         XmUSugCEirG1W44poEtt4zAPJ0wEbN+IF0BUoGim7szp1QNsxAFpetA96wiuHvc3O5pi
         5GSQ==
X-Gm-Message-State: AC+VfDyM6GNffL5pdg4kDzRl/+/6ODCB/V5yEFNWIKvufYfNpAEsarr2
	kMsz34w+jhzuQLvLbnBv3bE=
X-Google-Smtp-Source: ACHHUZ5vHyg2/Vz93cNtJWXlW0Cr2pAfwP67ir0M9Lf9E9Znb0Youi7lQxT6qXlm67BdxM+iu29DVw==
X-Received: by 2002:a05:6a20:6a27:b0:122:94d6:df11 with SMTP id p39-20020a056a206a2700b0012294d6df11mr7693183pzk.43.1687443228765;
        Thu, 22 Jun 2023 07:13:48 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id i20-20020aa79094000000b0065a1b05193asm4604268pfa.185.2023.06.22.07.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 07:13:48 -0700 (PDT)
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
Subject: [PATCH v3 0/3] clk: nuvoton: Use clk_parent_data instead and add a header file
Date: Thu, 22 Jun 2023 14:13:40 +0000
Message-Id: <20230622141343.13595-1-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacky Huang <ychuang3@nuvoton.com>

This set of patches addresses some of the issues that were identified in
the ma35d1 clock driver.

1. The external functions referenced between the .c files in this driver
   should not be declared within the .c files themselves. Instead, a shared
   .h file should be created to reference them.

2. Update all constant hex values written in uppercase to be lowercase.

3. For the declaration of parent clocks, use struct clk_parent_data instead
   of a string. Due to the change in the passed arguments, replace the usage
   of devm_clk_hw_register_mux() with clk_hw_register_mux_parent_data() for
   all cases.

v3:
  - Extract the unrelated parts from patch 1/3 and create another patch,
    patch 2/3.
  - In patch 3/3, remove the modifications about line reformatting, as they
    irrelevant and have no practical effect.

v2:
  - In v1, all these modifications were included in a single patch, which is
    not ideal. In v2, there were no changes made to the patch content itself,
    but the different modification topics were separated into two individual
    patches 


Jacky Huang (3):
  clk: nuvoton: Add clk-ma35d1.h for driver extern functions
  clk: nuvoton: Update all constant hex values to lowercase
  clk: nuvoton: Use clk_parent_data instead of string for parent clock

 drivers/clk/nuvoton/clk-ma35d1-divider.c |   7 +-
 drivers/clk/nuvoton/clk-ma35d1-pll.c     |   5 +-
 drivers/clk/nuvoton/clk-ma35d1.c         | 348 +++++++++++++++--------
 drivers/clk/nuvoton/clk-ma35d1.h         |  18 ++
 4 files changed, 259 insertions(+), 119 deletions(-)
 create mode 100644 drivers/clk/nuvoton/clk-ma35d1.h

-- 
2.34.1

