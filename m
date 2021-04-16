Return-Path: <SRS0=60Ah=JN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 602F2C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Apr 2021 03:29:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A781661184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Apr 2021 03:29:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A781661184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eJZQ3TFmcP0iGDmHJmo4M4bVcLX7w4sQLI0ofJXyXLQ=; b=YDZeWlaLech78RkLtFEPOmZm9G
	FJdtmW49sql1Hm3hpnhuhcE26TGoulxs8HypGyEOJMt43ItDWTMdRYePhERnR8YGm5pw2tFKDENBC
	9AY0ipC3QrsFDS1ySQpsx2i838trdgq9mh9NwrVFnJfUTIHZdCFzn2NJxQGZHL51d0+QIuOmZmBgC
	UZm/WPnCBlcZViWySaRpzylARHTyGfMWa1lvldDpaI0SwZftPHaCmhWlsWpnMRuRu5kOh4ts30Ouz
	upoCL+Lug4ma5PNayhJ9l8ZSJj72rX0m0lIKOWL8kOczAaf3eXJcHLAGYCD6TGnDRaqp/aEKzORvl
	YJg1x47g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXF95-000d7t-KM; Fri, 16 Apr 2021 03:27:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXF92-000d7Y-2E
 for linux-arm-kernel@desiato.infradead.org; Fri, 16 Apr 2021 03:27:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=hIEr+tr3/ET/1Cl+rSjZLlzUudCQ/0HpO0ED+ltgzjw=; b=r8odeEAigVSKS9r0XtwLR270Hv
 ghjkl7UP7k08Xp/RufFokPND5Q72RY+Jdw2vEVhxWK4cJOMblOqqqss8IWE74FJ3siNGHZJR/4Foh
 W42WCj+z9zOlGgsGkMv9wAAD3UVGsWU3KBzOTue9gAnb8qeflSEWzqcJ68PHTfsDy/zQD3gKN04+n
 HxMaS2Myx/gr3cJlQ1eDDFWdtOLzCNeW0l7sIlGIUgHybTh3A9j9ifY6fcPDslayFZRLD3cP/euK/
 4HP4Mu0HOQvf9aD+PHx8M2QTTAr3PxPO1m8D87gZ1ao6qmZLTCvlI70H4TzzL+NAQkw0OqWfF2znu
 KzHMQI+w==;
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXF8z-0093aJ-Fu
 for linux-arm-kernel@lists.infradead.org; Fri, 16 Apr 2021 03:27:46 +0000
Received: by mail-qk1-x735.google.com with SMTP id t80so350782qke.13
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 15 Apr 2021 20:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=hIEr+tr3/ET/1Cl+rSjZLlzUudCQ/0HpO0ED+ltgzjw=;
 b=lGig1pNBMlxzjmddWxyj0zU4kOdqrE+O58NgiXultbPSps0GikWUhIIpVBogYGDrqK
 MvxisbuXyv1tXvG1Ifc9AMlZqpofVA57Yq7HnOzFEAxQhWhEdNkA0ks//gnpK5rXdZnW
 E5A/RDr6c+C7OR33kSI85xUb0Gjc/yg9hSj9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=hIEr+tr3/ET/1Cl+rSjZLlzUudCQ/0HpO0ED+ltgzjw=;
 b=DSslzkB6Ss2lu6k93fCscgM9PjBlOrutuTEYzzWh6LE7w59pSWZug/ATSBOzPsGzFS
 /mytBiu9uNiIoDxUnBy3Q+GuZ0E3M0WZ7co+ZdkhZizdY0JCX9fYmi8zZynivOHAKbZv
 qQSLzeoUxnmVdtpQ9jWXDaQWUWVB3JsNPgNpVX/il1PU6prWMBm02D8lMCi1bXusOcgv
 2RArSmOfOewvG6jR7dVmlcxtVA/Zyyne3+K2+tEqquwMCQT6lqsh3j/X1gLnwwcbkzYl
 idhc1PD2CYW6DawUc5x8t21ar4tdDmMkBnFUqivzh4j+kXoIL/96EtJCBoCKKMATPSPs
 N7lg==
X-Gm-Message-State: AOAM531P11aOeGLSupFP5L2PtvxFdM/9U2b3rUrSPMbxYuBJfavaCUaV
 wmdRd8HmqJYyGyJ8kMbkERVAyaXhAUOkXVxJqnQ=
X-Google-Smtp-Source: ABdhPJwo7aOv9fBXv6Ye/9cef0EbrWn2KMN5NwfyUtDNGBb/rSIK+BQamE4oOXmWc6J2wernKD4FS9tKwyE65VxKFYA=
X-Received: by 2002:ae9:eb94:: with SMTP id b142mr6744912qkg.487.1618543663075; 
 Thu, 15 Apr 2021 20:27:43 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Apr 2021 03:27:31 +0000
Message-ID: <CACPK8Xeet50bqWAY0jG_GRkgvKvFn94XtGDaq1gaVYVkyV_JUQ@mail.gmail.com>
Subject: [GIT PULL] ARM: bmc: devicetree changes for 5.13, v2
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrew Jeffery <andrew@aj.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_202745_552580_98282588 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210416032731.Ozn03m2orYhnwoGNo9AoQR0thBGOd7OiPlHnNo2-oRg@z>

Hello Soc maintainers,

Here are some fixes for the changes that have already been merged for v5.13.

I also merged some changes that came in later. If you would prefer to
not take them then I can send a pull with just the fixes.

The following changes since commit f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:

  ARM: dts: aspeed: tiogapass: add hotplug controller (2021-04-16
12:28:38 +0930)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/bmc-5.13-devicetree-2

for you to fetch changes up to f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:

  ARM: dts: aspeed: tiogapass: add hotplug controller (2021-04-16
12:28:38 +0930)

----------------------------------------------------------------
BMC device tree updates for 5.13, round two

 - Fixes to the first pull request for Rainier

 - Small changes for Rainier, EthanolX and Tiogapass

----------------------------------------------------------------
Eddie James (4):
      ARM: dts: aspeed: Rainier: Fix PCA9552 on bus 8
      ARM: dts: aspeed: Rainier: Fix humidity sensor bus address
      ARM: dts: aspeed: Rainier 1S4U: Fix fan nodes
      ARM: dts: aspeed: Rainier: Update to pass 2 hardware

Konstantin Aladyshev (1):
      ARM: dts: aspeed: amd-ethanolx: Enable all used I2C busses

Paul Fertser (1):
      ARM: dts: aspeed: tiogapass: add hotplug controller

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
