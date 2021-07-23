Return-Path: <SRS0=Eam1=MP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F93C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jul 2021 10:40:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22BEF60F35
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jul 2021 10:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22BEF60F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pe+lNO2f9Rvah97Wz8+KcIzyHI9eex2MI75qZym06Zs=; b=FA7VfKbLb35ndP
	x+5XMDVaipo8QAfah1ALeFtbXBQJuzyTCLLk6So7AG+jxBrT/JNDpFdPdMONfH8nebLuxLAPiD1Ax
	PWY9zp62r45qVqDZfJ4EEBAnW6Eqk7wGzug8rr2WIw515l5S6kuY3xOTne8yFTFzz9G80laisCQVD
	P5lOuT8S3oGW5Je5is8x5DkCu7EJ4QHZ1bZguqhLtIFifguCL/mt09kXky8lW2AKiUlx8VjWZtPef
	0SifbgPw95Ih93OoDssoN44Fj4LyXqLhw73LnLE3abv9WHVCL8ieySEj8Aema3W54DxCvjLbJD+j4
	8Yo2jCRhUdSG9uuNOl0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6sZx-004OzA-Hv; Fri, 23 Jul 2021 10:38:53 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6sZu-004OxE-70
 for linux-arm-kernel@lists.infradead.org; Fri, 23 Jul 2021 10:38:51 +0000
Received: by mail-lf1-x132.google.com with SMTP id a26so1265781lfr.11
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 23 Jul 2021 03:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HS+KrbKWpPg6959vVc+gifN5TSsSydBGp7pXF+iv/30=;
 b=r7GcSBDAig/jsK+TLYxnlKfMPCesIsg38LoZQ/cBD/7LvqMsrhj+tZe3Qw6svxGLOw
 Wt3NwG3HAiFV0qp/87JXs52adhE4XdaYITwmey+cnGK4kcL0eiMES5ltYd+dRcVN5SQE
 FTKr6IVugqJhwmMiwnYeJIkkJftbjQUB5iqmcxkFZkSuKq3UN6oVZyOBx5xFpP/p4SPh
 5HQQMgtnaWTLWI2AK62Wzd1Q47J5FtjnItdrPqw4Hqyh55pz3nQ4ey2soMMEdxq0jkWt
 3GteKPHdXTdgRcg2OS/y/X1B4N1/ydkgPjG3IVWfuHJSKlGgZugZ/CPDE2fpcZ0swCK2
 8tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HS+KrbKWpPg6959vVc+gifN5TSsSydBGp7pXF+iv/30=;
 b=txPRpRGr68Voey29usy9958nUKsUsLLShKccGLG0SwzU5sfAVBi9rczw4tswwsVeLw
 nFXhHmb2lGaMSqPBDzW+MIi1l3EkUPwWEq3pwVHF5Yei61o+7OP2YYYQCtXYb101gQw/
 2XXmOJ1wjBJalt7ffQt9meL2iyFUoO9Eo+nP8aNNxTb1bSHbcF3YQBqOZvleJ6i02c6B
 tv6kQ940ksG3oE0EMVzbYF0lMyInWy2DaiTHWOehLusVtnRgsGaHH3mjAdplcl5/TTvl
 6XVAbcTgbny2SLR1ZIYTZIzqgTIoF+i77hxSMGIhDCdJHs7ShhSRXUny1aIsKmTzxs9f
 eq3A==
X-Gm-Message-State: AOAM533DPZvlQMjXeEj9gLp3YkQH9Y0Upcps6I5pg6yMGeuJTv/hM/+g
 5mFn0kFOJjlztgpLBiUJCdYTVUuHsfH/ge7qaqLsAA==
X-Google-Smtp-Source: ABdhPJxxCneK7uZOaNmZ8Jex91S2cTh3oIpLs58Y0lNCNcMJLcBcz7Xikn7o1GTvucpbIkZVQYf5jYjUbdCC4MQJNYI=
X-Received: by 2002:a05:6512:3696:: with SMTP id
 d22mr2724599lfs.586.1627036728197; 
 Fri, 23 Jul 2021 03:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210618205533.1527384-1-clabbe@baylibre.com>
 <20210618205533.1527384-6-clabbe@baylibre.com>
 <20210712201125.GA2401230@robh.at.kernel.org>
In-Reply-To: <20210712201125.GA2401230@robh.at.kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Jul 2021 12:38:36 +0200
Message-ID: <CACRpkdb_jpK77w5O-SW1PcDU-SYyrXCFaMgDhMaKa1MiL5HOEA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] ARM: gemini: add device tree for ssi1328
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Corentin Labbe <clabbe@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, 
 SoC Team <soc@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_033850_274906_D4B68F60 
X-CRM114-Status: GOOD (  10.47  )
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
Message-ID: <20210723103836.XfSmHwM1zbFW47gIve2v7pL4WjdERkQBKq8IiGn1Qks@z>

Thanks Rob,

I fixed some issues while applying.

On Mon, Jul 12, 2021 at 10:11 PM Rob Herring <robh@kernel.org> wrote:

> > +     model = "SSI 1328";
> > +     compatible = "ssi,1328", "cortina,gemini";
>
> Where's ssi,1328 documented?

I'll take a sweep and add all of the new machines.

> > +     chosen {
> > +             bootargs = "console=ttyS0,19200n8 initrd=0x900000,9M";
> > +             stdout-path = &uart0;
>
> Don't need both 'console' and stdout-path. (console should be removed)

How does one specify a default baudrate using that method?

Yours,
Linus Walleij

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
