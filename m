Return-Path: <SRS0=efRH=WG=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAED1C433EF
	for <soc@archiver.kernel.org>; Mon, 30 May 2022 13:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A46CCC341C4; Mon, 30 May 2022 13:08:51 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E8734C3411C
	for <soc@kernel.org>; Mon, 30 May 2022 13:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E8734C3411C
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-lf1-f53.google.com with SMTP id t25so16691735lfg.7
        for <soc@kernel.org>; Mon, 30 May 2022 06:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dIujuQod5DVdj9IOGigqFZqjY7YBi3dVh/6yMdzrZAw=;
        b=h5G+fuIO0MXa4WegYi6cGx9uxOUwGL335ePiupowBAHxVsTjTv2zGMWmH5tYUKXBku
         rQD7zP4p2tefsKn8OeY9Suv7SpgxClthr5atyE/xpNfG8OyVmLysyisekAbr3VPL2j9X
         q5BxejUFlVOAmUxVcrqVFvi3Hkw3aow9gqo9SfvPDuksIl7MmNaG6ZIBtT9oPtSQ0/Ca
         4o42P5s44jkJmlsUJiz7HhpZFc1CVxMn3hIf1mFXsUmQx2gJvIwoKLJzq5tIlHZSwkUf
         s3j4aoatQRS9eYBLKzGnmfB9CUI4LMeH8yQkv1jKI+DDqmeOMQBwDNF4M+WDs0+lLwgH
         eGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dIujuQod5DVdj9IOGigqFZqjY7YBi3dVh/6yMdzrZAw=;
        b=3RoxIWRmw2LZFKwSSbdbEjsEnrotJUK5V1n2m+I4BvUjHcmSxZ1VPrM4nokgwG6GPp
         XTnXxK1jqVgU/pTvs+iZQRkXg+91l8/Gweozj2dcF9F6POOGsqD1v3fEf/FgxNo4myTs
         16qO1fCPjc05NhC8KYyXpmgvAl+v6t9P5n8k2nXNSDwol5yv3yGfEnDxmgWdsb/9JZH0
         ghlRkB7uU5hfklWVDbdkq1Bt4vVhPlrI9+g9AoroN2bM8eSCJyV9muRpzdg7e81DYw8z
         m7o5c45lMVZGn6X9M9Xl4qXFwi74NPoEOBSEMYERdKu2MnNfpvo/mHXh/r7k3LwH3JEe
         KEZA==
X-Gm-Message-State: AOAM530TDFYnJlG4koMMuWIDvZ24//j1gfY/eu8PK8EoT2P7l0/d0FJd
	L1S7ktz2o7R/JtcKvOBjGM6Asdlx3qoknA==
X-Google-Smtp-Source: ABdhPJx8Ofkq27A7VN9Zy9Ow+GFIdKR30yfpaUH8g5z3Y7eK9RQtvqHPV2ok6+38zrAwcIU01Cjw2Q==
X-Received: by 2002:a05:6512:224e:b0:478:8f1b:50be with SMTP id i14-20020a056512224e00b004788f1b50bemr21778528lfu.639.1653916127590;
        Mon, 30 May 2022 06:08:47 -0700 (PDT)
Received: from panikiel.wifi.semihalf.net ([83.142.187.86])
        by smtp.gmail.com with ESMTPSA id d22-20020ac25456000000b00477a7c8a0f0sm2295701lfn.295.2022.05.30.06.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 06:08:46 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: arnd@arndb.de,
	olof@lixom.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	dinguyen@kernel.org,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH 0/3] Add Chameleon v3 devicetree
Date: Mon, 30 May 2022 15:08:36 +0200
Message-Id: <20220530130839.120710-1-pan@semihalf.com>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Google Chameleon v3 is a board made for testing both video and audio 
interfaces of external devices. It acts as a base board for the
Mercury+ AA1 module.

socfpga_arria10_mercury_aa1.dtsi and socfpga_arria10_chameleonv3.dts
have also been sent to u-boot:
https://lists.denx.de/pipermail/u-boot/2022-May/485107.html
https://lists.denx.de/pipermail/u-boot/2022-May/485111.html

Paweł Anikiel (3):
  dts: socfpga: Change Mercury+ AA1 devicetree to header
  dts: socfpga: Add Google Chameleon v3 devicetree
  dt-bindings: altera: Update Arria 10 boards

 .../devicetree/bindings/arm/altera.yaml       |  2 +-
 arch/arm/boot/dts/Makefile                    |  2 +-
 .../boot/dts/socfpga_arria10_chameleonv3.dts  | 90 +++++++++++++++++++
 ...1.dts => socfpga_arria10_mercury_aa1.dtsi} | 68 +++-----------
 4 files changed, 106 insertions(+), 56 deletions(-)
 create mode 100644 arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts
 rename arch/arm/boot/dts/{socfpga_arria10_mercury_aa1.dts => socfpga_arria10_mercury_aa1.dtsi} (58%)

-- 
2.36.1.124.g0e6072fb45-goog

