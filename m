Return-Path: <SRS0=rNyZ=FO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C31C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 20:04:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC50823BA7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 20:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC50823BA7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oDEN20Epuv+GhKvQceYrLq3AfDc0yzXk8OkY327tmio=; b=F7M/eW+nMhxb0r2lY4aJMcVWQv
	+iit17Gt5CotKbY2oWkk2Kox/b2EyVfmikWLmWv7Gu+pHbykL6UpYGNMgyOEchFgWFQB/irG4gWN/
	FdPyByJN4OeoNmclNtVBJEoE022qLBOemZzrl2lYN1QQr2w7A1r4NKcHs9zmkPSt4D8CZ6NPZ5Sve
	tVEG7tN8GvSzI63yYqSfoz1ZrXkuJBavhX5rPUViVq98oKjRnMKUZgXTnNJe7208wYtMo4yxR7lOE
	8KT4NUKuesA+H2jAMlObypXTFt8hysreThhtnRE8xfyWP/LvXuf1MVNOgJT7by1f2CXjtMIiGl4gw
	xzmONwVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knS9p-0001dF-40; Thu, 10 Dec 2020 20:03:21 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knS9m-0001cd-HN
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Dec 2020 20:03:19 +0000
Received: by mail-oi1-f195.google.com with SMTP id s2so7139466oij.2
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 10 Dec 2020 12:03:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BtR9F6p1ys0YkETvTwwNV2ZO40Vezo7i8tec8Hr766Q=;
 b=cist8tsJ9MD/n27STRnYG4lgO3W1m1sKMe+MHsH4G8e9QFTm5vMeyhgm6ElJANS7l5
 HizJpFWdty6ofXw2veGj7B9IAZ2pl97rPy5BJjPYqIVyYb0XTn8CSEEM5Oq8jUE+LVBX
 9xtMkb5PPHPAdT++4sXWpTMZZPSIlXctoggUYRE4eVMRE2JfxYD81tjb7+6mDBcRCJ/2
 SKDEczaZv7rutOwHUf554E3mcH2W8z3knFJWzl/WEqES6fWAJ5uWPtaPgvgSNtonpuOI
 CZS6yUKTBD8ekFPgHqe2WmsnRjoGtJyD6Zyq9b70RmHfqGdTbBGnxQeNkUazLFfympJw
 Dkqw==
X-Gm-Message-State: AOAM5311dZRtI0UMxXWsW+u7OFlvAHqJhrKszdDe1ReK0K8U1/1oxyrN
 2YPDoClro26U17P6GsyDiw==
X-Google-Smtp-Source: ABdhPJydQtd6sep0NfygPaKwINOdAqbJ8No1je6RXTu8rcLYonG8EvpVSZkgmcSslyjfqjgtpt8U9Q==
X-Received: by 2002:aca:383:: with SMTP id 125mr6508871oid.122.1607630597802; 
 Thu, 10 Dec 2020 12:03:17 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id o82sm1220636oih.5.2020.12.10.12.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 12:03:17 -0800 (PST)
From: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Jamie Iles <jamie@jamieiles.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, soc@kernel.org
Subject: [PATCH 0/4] Remove PicoXcell
Date: Thu, 10 Dec 2020 14:03:11 -0600
Message-ID: <20201210200315.2965567-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_150318_637763_06276B92 
X-CRM114-Status: GOOD (  12.95  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201210200311.lH8H_41NjInGTlg53pcYjd7Bsv6Y3BJ3PevTr9Nstvk@z>

PicoXcell has had nothing but treewide cleanups for at least the last 8
years and no signs of activity. The most recent activity is a yocto vendor
kernel based on v3.0 in 2015.

These patches can go via the respective maintainers' trees.

Rob

Rob Herring (4):
  ARM: dts: Remove PicoXcell platforms
  ARM: Remove PicoXcell platform support
  crypto: Remove PicoXcell driver
  dt-bindings: Remove PicoXcell bindings

 .../devicetree/bindings/arm/picoxcell.txt     |   24 -
 .../bindings/crypto/picochip-spacc.txt        |   21 -
 .../devicetree/bindings/net/macb.txt          |    2 -
 .../bindings/timer/snps,dw-apb-timer.yaml     |    7 -
 MAINTAINERS                                   |    9 -
 arch/arm/Kconfig                              |    2 -
 arch/arm/Kconfig.debug                        |   13 +-
 arch/arm/Makefile                             |    1 -
 arch/arm/boot/dts/Makefile                    |    3 -
 arch/arm/boot/dts/picoxcell-pc3x2.dtsi        |  239 ---
 arch/arm/boot/dts/picoxcell-pc3x3.dtsi        |  355 ----
 arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts  |   78 -
 arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts  |   84 -
 arch/arm/mach-picoxcell/Kconfig               |    9 -
 arch/arm/mach-picoxcell/Makefile              |    2 -
 arch/arm/mach-picoxcell/common.c              |   81 -
 drivers/crypto/Kconfig                        |   18 -
 drivers/crypto/Makefile                       |    1 -
 drivers/crypto/picoxcell_crypto.c             | 1806 -----------------
 drivers/crypto/picoxcell_crypto_regs.h        |  115 --
 20 files changed, 1 insertion(+), 2869 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/picoxcell.txt
 delete mode 100644 Documentation/devicetree/bindings/crypto/picochip-spacc.txt
 delete mode 100644 arch/arm/boot/dts/picoxcell-pc3x2.dtsi
 delete mode 100644 arch/arm/boot/dts/picoxcell-pc3x3.dtsi
 delete mode 100644 arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts
 delete mode 100644 arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts
 delete mode 100644 arch/arm/mach-picoxcell/Kconfig
 delete mode 100644 arch/arm/mach-picoxcell/Makefile
 delete mode 100644 arch/arm/mach-picoxcell/common.c
 delete mode 100644 drivers/crypto/picoxcell_crypto.c
 delete mode 100644 drivers/crypto/picoxcell_crypto_regs.h

--
2.25.1

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
