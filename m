Return-Path: <SRS0=JfSO=FJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64033C4361A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Dec 2020 21:44:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1495423108
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Dec 2020 21:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1495423108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rbri+t59nOcmj6nvzXcfTNygFJJdg/0JCn6Z07lMGCU=; b=x5w/xUKlkawBijHhMZzZw9/pA
	h7d4eIif75t772YdfFwIAiHoalmFCy3ZVHU3k6h7ehTR7HhI50Sfy7vQQ8bj+jmU0YGc6ltaqsMEQ
	rTirJIrzaDQKAVm1aqphYx8zbw0lscSnNIPmqlhtZ/cPSpcqge/CNXzUwle7+81Psi+K3lLrrqFvL
	DWwNgQfp2rH4gdyqf3DdD4v/FvDhB8izGOrEbdwTBr33oUCIDP2+c0wNCjzWVEhIMYjmbhdmgVCW6
	piqVf5MVULO4i8w0EKM/x7IZK5cEEam3U0KaLFmoxRGVOK5xi+wRUp3CUbVYZC7dwAx+9xW9XQLJU
	SOPoH6Fvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klfKk-0006T5-2H; Sat, 05 Dec 2020 21:43:14 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klfKg-0006Rx-E4
 for linux-arm-kernel@lists.infradead.org; Sat, 05 Dec 2020 21:43:11 +0000
Received: by mail-lj1-x244.google.com with SMTP id j10so10722198lja.5
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 05 Dec 2020 13:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=700HkyTVIFp9nZiWIVsyfYqFVm65sXEMC2ghItegDYE=;
 b=YafReqCUo5/xizSfSIS3eP6fIPD2UUW2x4UkHHsy1SSLo8OE8qcD9agG/wfCEVdrAG
 SxObFlizYVZ3nb6EqQyXyKNsVjQF6A/GwwsFLTbqirAR4miX3Em8ffTq7XUGZiIe5uT0
 uxqUeG/gaUj+pmjrQsHQrtxKVaeZHzld9tPg4ZGin61fb166k92rwaWcNR4o1rN1tnwV
 7hJj3ivRoqBOwgfqvdyGFgaNMIoFzKCXO2FgHx9F7hF28iGduKGjHT7llzihQF+/dF54
 T8D/ADXwaIOUnrxzXrz3RNTCbpux8yUVY+6aXwNRnEtMGuWBO0ZcoLRT1WZE5XacEm1L
 8c/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=700HkyTVIFp9nZiWIVsyfYqFVm65sXEMC2ghItegDYE=;
 b=XYA84mlaLjM8k0A7D75DZFEp5b257t510Ym9TGh6v/iTSXu5YkWg0OL4NwgMb0euSt
 oWams7zhAy8munSh8KvMNVKGJLnlr4/kpJWlbcSW204SbL9Yfw7O6Jd96TRqDzufzVEz
 yaDhL1rEMopL2ewCLexlWVLH0UCPvxVJ35EJeOFEwEKCYG+YsbxizS0cqEyHLEOvsEc5
 RHrmtWfFltQlm2Kxpkc9rzXlfQr2icfNDp0HyEHQVRJxN4jEcKljSK4A9s6NCZRoOES6
 iCxoeniPFwX3CQiNrErLse4gXQZkbjNDkdEVDzDM6gLXP0vIFF5IelWpDp7+a0BRGlQ8
 W60g==
X-Gm-Message-State: AOAM531I+tnGXfs0XAGgCw7XvRPBI7+1EMUE4cs/gsn1azdg/bUS/toS
 tGROE7FXPj48CUP8WTOuzQ/1OZzsWJrar0SXhO0tww==
X-Google-Smtp-Source: ABdhPJxOBXULP7OBc7vXFcwbfQDybB9Vs66oJlYkEGsjHLd3VRw9w9OMx28IXZxfzQVww4oMJ5ir7VUoAimLdzmSMDU=
X-Received: by 2002:a2e:998e:: with SMTP id w14mr6262208lji.100.1607204585830; 
 Sat, 05 Dec 2020 13:43:05 -0800 (PST)
MIME-Version: 1.0
References: <20201129110803.2461700-1-daniel@0x0f.com>
In-Reply-To: <20201129110803.2461700-1-daniel@0x0f.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 5 Dec 2020 22:42:54 +0100
Message-ID: <CACRpkdYEzFYw=CbBFCs9=DfarsCQKD0zA2WvE95nF8ehA_2i1g@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Add GPIO support for MStar/SigmaStar ARMv7
To: Daniel Palmer <daniel@0x0f.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_164310_860962_8A8E174A 
X-CRM114-Status: GOOD (  14.27  )
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
Cc: Rob Herring <robh@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Willy Tarreau <w@1wt.eu>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201205214254.-pwk4tqy2pknR78ysbv5Xbi2aItknDaEvTYmdkU622U@z>

On Sun, Nov 29, 2020 at 12:08 PM Daniel Palmer <daniel@0x0f.com> wrote:

> At the moment the MStar/SigmaStar support is only really
> capable of shell from an initramfs and not much else.
>
> Most of the interesting drivers are blocked on clock and pinctrl
> drivers and those are going to take me a little while to get cleaned
> up.
>
> Clock and pinctrl aren't needed for basic GPIO to work (all pins
> start off as GPIOs..) and it makes it possible to actually do something
> so this series adds everything that is needed for the main GPIO
> block in these chips.
>
> Changes since v3:
> - Remove unneeded "gpio-ranges-group-names" property from binding yaml.

OK finished!
Patches 1, 2 & 3 applied to the GPIO tree for v5.11.

Thanks for the good work!

Yours,
Linus Walleij

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
