Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80915C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 17:11:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40C0F64F4B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 17:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40C0F64F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q8f3OBFB+IFC3/cj9Q2Hfi21KAq1UJAr4KGreqUW4S8=; b=Oj0wqiG5dhvMYVtMTnjmhcp45
	esPK9AeiJ+zfNAu1jGKLVnwhbIRVG5HziCP50mTeHz0iTz1EKeWEuksY/eR+lzqwicPObrv2zc7xA
	rhIklER3XWD30gLcThb6ffkmUjAOcN9mQCOO6J5bgzxZi6T6Z0EGJchfP6Cqvisok3OFudBvoXtne
	1sjE0D51eYbo8hlH6UaJppos1WqHOV8scciucoEe5RTwAaHC7SjgvCSBzJdpx23U03DfUD0d9TKlk
	d9qV/7jY8Q01U658VwI+Fipu7rCNvC51J/I3p1zgRiJqwh3LJJHkv8Uc+o2DU/c5icek7YgFDZqC6
	sFvp4c8eA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6zCB-00036J-Tg; Tue, 02 Feb 2021 17:10:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6zC8-00035R-SO
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Feb 2021 17:10:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 940C364F8A;
 Tue,  2 Feb 2021 17:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612285828;
 bh=n1En1YLsvhIFHDL/bHDovjiiN1YH8YRRfAM3SkCGU3o=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T8GVO+Lv7frIDNOIlNzFe650j7WZRajEmJItiOhuFwjgqx+TGhdOfFiJv537mGrfm
 m80YznJMeajrl+cctwYJGpq0ft9j+KCAE26D1INA/vka+WNI1hXAv9/Xo4r8kCHDch
 x5d6EGwMtks1wdI0nRqYX3pa0Z3n/WdI+imamBVqwhu99/m8XcEjeyKccTRbzG9RJf
 M7J5kjalT0s/3+biRPzZDg9uz6Uw2QTcz3UwTxDeoWMyR6xNmN/E0Sd7CQ5HyxHyBO
 d1NB8BWDSEzmxfe53VWuUVnI1usN7OeQdsItA0He9Kg4wSfvLZuTqfG5a0dqSaZ5gw
 H5fxw+nWtrCIg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Gregory CLEMENT <gregory.clement@bootlin.com>, arm@kernel.org
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v5.12 (#1)
Date: Tue,  2 Feb 2021 18:10:09 +0100
Message-ID: <161228552323.1852435.8043125783469757212.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <87pn1jn48s.fsf@BL-laptop>
References: <87pn1jn48s.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_121029_002450_35052C3C 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210202171009.olr3oJjPzX_8DtpgBTyGqfLvlYDsqM8M_YwaUzGOu10@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 01 Feb 2021 17:26:43 +0100, Gregory CLEMENT wrote:
> Here is the first pull request for dt64 for mvebu for v5.12.
> 
> Gregory
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 481d73c663e138a256988beca54152545ad265f5

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
