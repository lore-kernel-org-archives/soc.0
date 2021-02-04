Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F93C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 21:17:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBC5164DF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 21:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBC5164DF8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ef+9jZlqhffEJa/8nPFXaYG0VYonjnLsVhSXxYt9+rA=; b=dIdCZPtKVdRRH4P4leB9U9587
	X5hQf3gcJJ9MA5z2Yi6BO/4sPIkM2+tFXCu4Fapc3YAuxgLyAb1ETgBGBImACenlzNPfV7FQJw2kJ
	IMdM5A2XBixnkvNalf5dYXB375I3SCytDw7xBYdIAJNtneXHnk1vpVlL33yq3wHOjeCI1y1HPpk1R
	wUy1To60ABCHTZqet0usc3O68JCAXKO8vGgS0VQXxZi1cCcrzUK4oYWU/ofXUkLDW/6UsvRaez/8z
	gIw9VR1Na0EkwLyrD67TLNeE0k3Oh9GNcVZV+HHtwdnAVk6u1MJUwam7eT6DkqBZSL/Dfem4MMj41
	oBsiy2YxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7lzc-0004dA-Kq; Thu, 04 Feb 2021 21:16:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7lza-0004cq-4a
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 21:16:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3254464FA9
 for <linux-arm-kernel@lists.infradead.org>;
 Thu,  4 Feb 2021 21:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612473405;
 bh=hFlPJEpX92eRZfDmwMnWNQRtfdiFjtLU0seS8Hu8j44=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=ioIOH/1GevlsN14l+YKusoCH1YcT/HykJXrbioNxCTvyz+OTbVdbv8nYClGuS0xdQ
 /lFESUhp4uDqvOGiHyRbEZ2ZZGbobPfw1662MBRyKd4SvQGGWpwdosmYa9/0CQXwrX
 2X39CagnwlpoN4abAUdTs/gVtTAfhTfknnCSOIC6A0BvIQB15s97pJJgiB9qpuNvQX
 wQPH2+h1NMmKofjsF3OzA9YBUFQpdrnDkOkplgWhEye5jqzlX1zwB5U+MzCAhDADUR
 QCQrErxYysGPc/ueMbyWfccCW2/uuj05KfInHXZPcXHWN2fytg4Tnzb17a8I1R0/12
 JG+Ezl2xoGUSw==
Received: by mail-ot1-f42.google.com with SMTP id d7so2600041otq.6
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 04 Feb 2021 13:16:45 -0800 (PST)
X-Gm-Message-State: AOAM531gHdS9nbij3zprW3n1sm6X5uJlZyTu3S/iWKsZINAd4sQfPq0D
 GppfFCQfslZ9ltdiMTh+LWxuonPq1ZC6ZwT/VOs=
X-Google-Smtp-Source: ABdhPJyhWd5lBy0oDlCjI6uSP/wrkn6ATGMHUHfhJR5MuoSb9V/rgAdV3QhSEWHdaZ0VCEOBZvfjaCMHgHnosQ4Pxpo=
X-Received: by 2002:a05:6830:1256:: with SMTP id
 s22mr1012064otp.251.1612473404388; 
 Thu, 04 Feb 2021 13:16:44 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-8-marcan@marcan.st>
In-Reply-To: <20210204203951.52105-8-marcan@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 4 Feb 2021 22:16:28 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1n+C5V5J24myy_h67DVp2YTN5Hd=tCWjPUYZcrAX4hCg@mail.gmail.com>
Message-ID: <CAK8P3a1n+C5V5J24myy_h67DVp2YTN5Hd=tCWjPUYZcrAX4hCg@mail.gmail.com>
Subject: Re: [PATCH 07/18] tty: serial: samsung_tty: enable for ARCH_APPLE
To: Hector Martin <marcan@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_161646_496840_72C0FF6A 
X-CRM114-Status: UNSURE (   8.87  )
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
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210204211628.Hnh7-5bcyJBFaUzBFXn_aNhixgfFrIzbgiTyI7PcLxk@z>

On Thu, Feb 4, 2021 at 9:39 PM Hector Martin <marcan@marcan.st> wrote:

>
>  config SERIAL_SAMSUNG
>         tristate "Samsung SoC serial support"
> -       depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
> +       depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST || ARCH_APPLE

By convention, please keep "|| COMPILE_TEST" last in the list.

            Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
