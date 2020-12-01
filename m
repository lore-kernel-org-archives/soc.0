Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F8DC64E7A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 13:45:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE3832084C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 13:45:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dWJaIM38";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="K8H5ts0U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE3832084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8lx06xxTWMgPo2P/tgi1p1nF5Jx6fx5m8PlDcfhdANM=; b=dWJaIM38TIlfyd7JK8OJtPCYUK
	ei8gvryNnzMz6x2XS3vtNsCu3J3TBgum7q9O5DcdVtcAeyEgqYhitkeWNVRnUp2wURBegU2CcBZkY
	tAnVpx4MBl32rhkA8hHj87d1yFoJDJYdvRf/L8c182lAvA6P95STZewolsPZyIfsmDf+uxRgzvPOx
	aS7/r9Q5tcXEOb2fuRVvzl0cJZBigeSrrbDgF/UjM3c8MaUGs+tDFD5C8na2XOkRbDr2wHDVvL3td
	MenvvxOVK7H1YeMMqM6M/gc2Kmj9a9DrpqUGELLbandd2qlmin9ptOoymg2ph7oaUSUqrGlWXSc/u
	vp1F07QQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk5wf-0006zE-F5; Tue, 01 Dec 2020 13:43:53 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk5wZ-0006vg-Qg
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 13:43:50 +0000
Received: by mail-pf1-x444.google.com with SMTP id x24so1140155pfn.6
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 01 Dec 2020 05:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IkSu8cOxrJeXk2IOxGlsju6Rx6kE3VnLWo/bGlavpVg=;
 b=K8H5ts0UpSYaUeP2AKhudXY27BXqCNe5Ycflq09qZZOmIlMYps+H7RCe9xYhL7hEZm
 fxBEdLxy/mo/3htJ5iSO7JM2b9T3a+rLm85Ev1aMFKAqQVLaDXTASo/qoCBlLz0EI7mg
 5c1Hsj9jXgKyiVGh+7thXN7fE3+Y97Y3NriAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IkSu8cOxrJeXk2IOxGlsju6Rx6kE3VnLWo/bGlavpVg=;
 b=dKFNP98R/W8UP28/pPlTTdjc3V7/1KLRAp0N8ytuiQg970aVdh1ve23kIWqimM38pO
 a85SOb9oSV79wLVhduzqtKprUMkYyH5g0FNY8SJTlts+drP12ZA5iq94VPBGzZuCDJt0
 km5EnKGDc42HlLT9w3ckqgwaiyt0yPj4Zk1e/2yIgPcRL+4km89vo40LR/WZzbd0LbtR
 hlP3bQr5s63J79BmnN040J7tmmrDlGIUuMHkkEw9ehanboWvVDpJrTiyq00ZKeOPOxWv
 QERXlUoyu1AMUS792BF3Z+6nrjJXmu9QIP0OkxUATuKYpJKxe3SGcCIyxMTQogsZ4ls3
 Q7iw==
X-Gm-Message-State: AOAM533yOOGUjIsZh/tx1/w3RaHyTUZKr+BMK3Z4HR2++S69C8Q8tNvU
 d5iHnFd1sZmw6FwUldqJmkH6WqSrCHSa7A==
X-Google-Smtp-Source: ABdhPJztNDi0pOH7QULtZg4/rCPDCHM4rfyzQeOdWfYLRZdaSFqJboQ1cxTX73Et8D1R9mAVdLkcgA==
X-Received: by 2002:a62:445:0:b029:19c:162b:bbef with SMTP id
 66-20020a6204450000b029019c162bbbefmr1288016pfe.40.1606830217495; 
 Tue, 01 Dec 2020 05:43:37 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp.
 [118.13.124.123])
 by smtp.googlemail.com with ESMTPSA id g14sm2839248pji.32.2020.12.01.05.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 05:43:36 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 00/10] ARM: mstar: Add basic support for i2m and SMP
Date: Tue,  1 Dec 2020 22:43:20 +0900
Message-ID: <20201201134330.3037007-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_084347_901687_27603477 
X-CRM114-Status: GOOD (  15.79  )
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
Cc: robh@kernel.org, arnd@arndb.de, daniel@0x0f.com,
 linux-kernel@vger.kernel.org, olof@lixom.net, w@1wt.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201201134320.DjtRb3gnZPmZeMMlXybRpRBnqlUx54XU0lZ_SmbrxGw@z>

Sorry for spamming this. I wanted to fix the DT parts
before anyone spent time looking at the DT related commits
in v1.

This series adds basic support for the infinity2m series
of chips. For now the SigmaStar SSD202D which is a dual
Cortex A7 in a QFN128 package.

These chips share most of the same hardware with the
currently supported infinity, infinity3 and mercury5
chips.

Changes since v1:

- Based on Arnd's feedback[0] there is now "mstar,smpctrl" as the 
  most generic compatible string for the smp control registers 
  and a more specific "sstar,ssd201" (yes sstar is right, this is
  a SigmaStar chip) string that is good for the SSD201 and SSD202D
  chips.

- Small code clean ups: remove initialiser for smpctrl, remove unneeded
  #ifdef CONFIG_SMP, make the smp_operations struct static and const.

0 - https://lore.kernel.org/linux-arm-kernel/CAK8P3a2MC5m4PdmXnwjGw_oZinKU93LP+eYQ8qaCmH4EesH0Bw@mail.gmail.com/

Daniel Palmer (10):
  dt-bindings: mstar: Add binding details for mstar,smpctrl
  dt-bindings: vendor-prefixes: Add honestar vendor prefix
  dt-bindings: mstar: Add Honestar SSD201_HT_V2 to mstar boards
  ARM: mstar: Add infinity2m support
  ARM: mstar: Add common dtsi for SSD201/SSD202D
  ARM: mstar: Add chip level dtsi for SSD202D
  ARM: mstar: Add dts for Honestar ssd201htv2
  ARM: mstar: Add smp ctrl registers to infinity2m dtsi
  ARM: mstar: Wire up smpctrl for SSD201/SSD202D
  ARM: mstar: SMP support

 .../bindings/arm/mstar/mstar,smpctrl.yaml     | 40 +++++++++++++++
 .../devicetree/bindings/arm/mstar/mstar.yaml  |  6 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 arch/arm/boot/dts/Makefile                    |  1 +
 .../mstar-infinity2m-ssd202d-ssd201htv2.dts   | 25 ++++++++++
 .../boot/dts/mstar-infinity2m-ssd202d.dtsi    | 14 ++++++
 .../boot/dts/mstar-infinity2m-ssd20xd.dtsi    | 12 +++++
 arch/arm/boot/dts/mstar-infinity2m.dtsi       | 22 +++++++++
 arch/arm/boot/dts/mstar-v7.dtsi               |  2 +-
 arch/arm/mach-mstar/mstarv7.c                 | 49 +++++++++++++++++++
 10 files changed, 172 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mstar/mstar,smpctrl.yaml
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d-ssd201htv2.dts
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d.dtsi
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m.dtsi

-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
