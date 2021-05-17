Return-Path: <SRS0=iJAY=KM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B8AC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 May 2021 19:34:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FFA961263
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 May 2021 19:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FFA961263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B3ghmOBzGSn7N87eDrUw5xlYRPpQ8NN6bNI7TknGMcg=; b=biyG9wUWo/LAyNjoLP8XuTiY1b
	mjdPD17nAvt2sd15jXMJ6wV/6mmsrHAopkmT9N9F1OTyp+Bg/Hb5tXyvMfvkW9RXkG4QZ72AfKsRJ
	AsEWMU7FC8KktnliV8/CM/jd5DKU76FaV/DgW71ErqBT7FpO82FjE90ToGRvUG/az+ATj2WP23Peh
	6DovWLHsP1dKjEmBrJsQE7axfebtWaB49//lFMDOsBWkV+/r2vLTPi3sluGG4gTyH4Wp+XpULZ/4w
	BNDZYaZSQ+9SknUqEzEhZV+If9bFfwi6CQT0DyJ3XxIwF2x88uReLyL+8hBUbQbmLmeJttZVebBKb
	1Vsa9Qyg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liiya-00Fwrf-BE; Mon, 17 May 2021 19:32:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liiyU-00Fwr5-No
 for linux-arm-kernel@desiato.infradead.org; Mon, 17 May 2021 19:32:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=o1MWPbCmhKRlzL0yQboMxEH1Vw5Cn+akoWVJYorN7PI=; b=AebWRGOONgfDr5ttVcd6r8Wy42
 ZcST/KCT8cBM2IDdqBP1MTR7OHLYeLuVKtGTNL716QH+91L3HPaEClWxXVJOifPcwyBvkxaoZBHQj
 UmZOP3nI4Yab/vDP5Gadm3DwJKxYvwxvTDqa8Te7F7V1PxxLCCoVjAVgLLW24jjZuu5GT7kfQq4bA
 ElP1ywVzlfqLoHZtuBEfQXRZBqFa+LEAeZjg+D5pCAmNqtY8d+LenyQeiLQgamhT8m9vP8yF4Nj+f
 eodcKhv1U72gWHRaPlbC3IQcfRmO5MCMdZ/aMiboaCtl5bNparT+AhplD1vR7WxIhZsByh+ZBpqq+
 R65xc+jw==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liiyR-00E5mu-G2
 for linux-arm-kernel@lists.infradead.org; Mon, 17 May 2021 19:32:21 +0000
Received: by mail-wm1-x330.google.com with SMTP id 62so3151298wmb.3
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 17 May 2021 12:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o1MWPbCmhKRlzL0yQboMxEH1Vw5Cn+akoWVJYorN7PI=;
 b=gMdukzhdloaqM5m8ubf2QsTgloFt0oz4um3ZEfJnC6cRrLb4WDhRkOO8MNcXJ94tzK
 OsESwrpQ+vzWnStApEaLzk1FMuLyLEIdf/9Z90xd3FZNVj06J2RkE1n9bxgY6fe/8Ncq
 oMgmF2/Lb4Ef9gxGuRWxbug+9XbrOFu3dztlMNhzuKM4goSO9cB79LOp8yCHrch6G5z1
 HWJ0aecZ9uoZonwBT8M6tSqtz9Xl2UXBHAhYliIpdVymj8MLW0MqFmKaLA5Z/2EOyLDb
 5P2DbcnKIVCSr2++Fcqi4xE4GWwqr7q4xAfJua5M+zhShrrYAB1xyMBmX/O5KdCAXWia
 kKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o1MWPbCmhKRlzL0yQboMxEH1Vw5Cn+akoWVJYorN7PI=;
 b=sr0Uqogb4YwxwzJazdUM3TPz695vf7B0JbvuN8MgYO62iltQxk7gzYrF0IHcMiohsN
 tLRVxJRKhRz28m9vZmHfJ13bEt7g2COKBcBrWmJM4Gott/1C4F94KvGw7ftfd3fd1CHb
 NOWnLw04UXRJ10zXGc8UKIonw8Si4P8oZtnvJJL7yw28+yYxLk8ySK6FHSGyVLJrQ2Lu
 YkIoLhaXasjkU/yLFaPvH0Y8RYFly1MBCO93P4QR6lP4rB4BfnyOK/gsexXpfgQ9u3Z4
 /RWuTNHFIuix6a8flqFT2/PIDKNPlt25r6vgweg8YCORBlbNwr0FqbqwCsAQ/ffEcDmk
 4GyA==
X-Gm-Message-State: AOAM530ua77v8QSm7dLZbrEu6fMUMuxKRe90HgSNVbnuaV7JHZpkJb40
 dzLbzcPp2fY3VuS42TOiVd7gKw==
X-Google-Smtp-Source: ABdhPJwsv8iDnA2SN4nduILJwkjwb9WmpT/ZkNYhNGWcTPOkmyY9kui9eXiLhc780cUiLjBIdSA3DQ==
X-Received: by 2002:a1c:1f84:: with SMTP id f126mr617294wmf.189.1621279936942; 
 Mon, 17 May 2021 12:32:16 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id e10sm18928907wrw.20.2021.05.17.12.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 12:32:16 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, linus.walleij@linaro.org, olof@lixom.net,
 robh+dt@kernel.org, soc@kernel.org, ulli.kroll@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 0/5] ARM: gemini: add two more board
Date: Mon, 17 May 2021 19:32:00 +0000
Message-ID: <20210517193205.691147-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_123219_560086_9FB26475 
X-CRM114-Status: GOOD (  10.84  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210517193200.LaWfmIq6Nm9exOeYsMor53SDNnStRxu77m-INtHHc58@z>

I have two boards with a SL3516 SoC. Both are NAS box.

Corentin Labbe (5):
  ARM: dts: gemini: add labels for USB, IDE, flash and ethernet
  dt-bindings: add vendor prefix for edimax
  dt-bindings: add vendor prefix for ssi
  ARM: gemini: add device tree for edimax NS2502
  ARM: gemini: add device tree for ssi1328

 .../devicetree/bindings/vendor-prefixes.yaml  |   4 +
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/gemini-ns2502.dts           | 141 +++++++++++++++
 arch/arm/boot/dts/gemini-ssi1328.dts          | 162 ++++++++++++++++++
 arch/arm/boot/dts/gemini.dtsi                 |  12 +-
 5 files changed, 315 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/gemini-ns2502.dts
 create mode 100644 arch/arm/boot/dts/gemini-ssi1328.dts

-- 
2.26.3


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
