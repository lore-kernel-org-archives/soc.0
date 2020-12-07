Return-Path: <SRS0=s/rV=FL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF60C4167B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Dec 2020 10:57:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F30A20809
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Dec 2020 10:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F30A20809
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kVfd3LXCiN38EajSfrCY8x0EjjnRboSppEv7mMJNaOY=; b=zQRkPAiUxSmaMRd8NQmKmMYGs
	0gOD1K0rE8FZDbav0GtxWOc4aPSW1joZJwj+HMlsaAgg4ymoP0emMlg6/LVxJGQh4YWAqNnhMvS2l
	YBc9YKL/wmz+zYKvEdEtSkhexynJ7oOfdynX+ypQmaFPW+VUR66Wc2GUwGf5ApAbegotnJGD+M+kS
	UyH4bHToGVDdAPs2ByGT2k64RFh0ZCdiANhJsuyXBWlAea1q/Va9dKsW9LmmO7ZuQcGcN0nk0Hx8g
	HKb0tYd89rG8cfsxZNH6bKo1gpYwUhyES750ZjMoUmQH7Mvxn9AIfOz760s4TAUgXKlpQf6nfIQzy
	Xx4kthxsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmEBX-0000yh-49; Mon, 07 Dec 2020 10:56:03 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmEBS-0000x7-MU
 for linux-arm-kernel@lists.infradead.org; Mon, 07 Dec 2020 10:55:59 +0000
Received: by mail-qk1-x743.google.com with SMTP id w79so1023375qkb.5
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 07 Dec 2020 02:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5ia12m9uDX+0LNlAEFwkrOarHwftjJKLgewl2oTIgrE=;
 b=lzzmt0CZmK2Jmd7kyroYw+RWFtJX3ikmVxwIpkx+vZ/gCDKMah0PBZ3pRvKxqo8lN4
 eStRjgjM4ibwnew31RMzb0hOwrT6uiFAFmqPXGWbPGnLbol0VBIpkeSQGAMsmcvQpOll
 n6xniOcxXcDXSYxpEDnLx9saK/zqAazjt5HMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ia12m9uDX+0LNlAEFwkrOarHwftjJKLgewl2oTIgrE=;
 b=r5hwgoEl+WvYO2J9SnSBKQjc0c5xSDUd5X5jwJCjvBg7YKNxmJ2cflPhNk6sKAK0hJ
 xDZLKbOEqd2lbW4xb8Z7FEqcgYgm0ZqcQopc2XpfyKNdLb1Yr6gQANLLP5kG4bp1cMUa
 CEJ+ogPxwdOPpOecwmTyPztZNjxoeLCDwNLwtUlehBM7Xc49IxapkmAjHELBUjb1Nbk8
 TR8u5PGgPnX51vvB8Z/OtIDxHD/2yAEV7TliQPvCtNKGFNadg/Ya3EmYm+cQbUwjp+hd
 L8AapsTGAXaX3ZB2t+NBesMP2JJqsuex8inAXB2Kvt7PLVsMigkmBpGRQDjWiScdmg1q
 7sPA==
X-Gm-Message-State: AOAM533gnDtKW9mDvESAZQuNg3wyR89PDuSET/WMTqKoOdDP9mTNSU46
 pYu07kNQ4R4O0F7ttFnQu2P0ZsQ7yAdEgRiVH+qu/w==
X-Google-Smtp-Source: ABdhPJz5LN12jxi1tLmMe+C2qEWEij3QetZAtETxe63ezdGfiuGGd8prNeyfZ8+OZ//s1SFdN8nthpHV6T5ni1agtns=
X-Received: by 2002:a37:8681:: with SMTP id i123mr22759135qkd.54.1607338554890; 
 Mon, 07 Dec 2020 02:55:54 -0800 (PST)
MIME-Version: 1.0
References: <20201129110803.2461700-1-daniel@0x0f.com>
 <CACRpkdYEzFYw=CbBFCs9=DfarsCQKD0zA2WvE95nF8ehA_2i1g@mail.gmail.com>
In-Reply-To: <CACRpkdYEzFYw=CbBFCs9=DfarsCQKD0zA2WvE95nF8ehA_2i1g@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Mon, 7 Dec 2020 19:55:44 +0900
Message-ID: <CAFr9PXmx1XZmVOp8mLygnDUfEKPpo6=ZQPMKSCnZf0i23mNqVw@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Add GPIO support for MStar/SigmaStar ARMv7
To: Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@kernel.org>,
 olof@lixom.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_055558_945856_A658AFA2 
X-CRM114-Status: UNSURE (   9.87  )
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
Message-ID: <20201207105544.R8hCom2q6w7hS-Bp5lEq0eiT2MKl68KLxFaWp6b4xbU@z>

Hi Linus,

On Sun, 6 Dec 2020 at 06:43, Linus Walleij <linus.walleij@linaro.org> wrote:

> OK finished!
> Patches 1, 2 & 3 applied to the GPIO tree for v5.11.

Awesome! Thank you Linus. :)

Arnd and Olof: Sorry for being a noob.. Is there anything I need to do
for patches 4 and 5 (device tree bits)?
They are in the Linux SoC patchwork.

Thanks,

Daniel

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
