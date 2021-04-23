Return-Path: <SRS0=UfjI=JU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01614C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Apr 2021 14:05:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C257613B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Apr 2021 14:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C257613B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IJrLyCK9d506AkYhF5nMg755vWio3TbY7i8RT/+jYJs=; b=LMOCMPpISSvB3RIDjB7h4wBnK
	khIOBuNIAvkM9oegcvhewID6g27zcMb09lG8QvHHcFNTYHLQvlDTMWey8y6BZnA9GKhRMKL2TudKq
	cd2QnGt1pCykg2NHVlrpCE6FXJgTxr/jFQkM26TFA9EqPHdCxjntEs2fLijW+E9/DUj+msNGcGypH
	flntLUCaDKwzvbQh8JuUjKMNYQmyLR8nR1YnOgrUQbqitabgrd63H8LrEEJv/xxZnXBNRet6SGMIz
	nL3dgV4jOD4hRmaO95iOWG7gnuyQkzzevO2T47deoIu7cI6M2hI+hphfrp2Ve2kqzg3oWp4oJTYpe
	6jpU4ieTg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZwOc-001en6-Ej; Fri, 23 Apr 2021 14:03:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZwOa-001emm-9I
 for linux-arm-kernel@desiato.infradead.org; Fri, 23 Apr 2021 14:03:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yVfMqSBfK2/PqYx0vrefAbZn8CuJJPRDt4Z7FHHTIMk=; b=AWucrHj5P4dIwy9F52eqLpj75X
 KhS8YB7ZUKekoGqzAExz+VydIs+nfkZMMfvWEF+/c4YZ6WTam9Ost+unajChsL+jdDk4PzwVyz3OQ
 EcNdwPFNf6MDJyUbUbHzRbdPghoj6y/AxUg5O10qDouIAXG0kEahNsYbqSu6ZWS1SF0Yqd1hS1sQN
 OmocMRXLZbnaey1JdWD8Gx7tlvW29zd6eoJLf5K/ZqRBOV5Sni/NvzTnqzm48yDakrGqMm3wgXqMF
 Vqd2ZWrpRm513grLR6roNQ7y/xIZ7ABsLicyXZrDrx0urEx6PMc2EuivUkva/0JE3b/dxc+E+ougI
 k9EKb96g==;
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZwOW-00ESS9-Pp
 for linux-arm-kernel@lists.infradead.org; Fri, 23 Apr 2021 14:02:58 +0000
Received: by mail-qt1-x82b.google.com with SMTP id u8so36359690qtq.12
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 23 Apr 2021 07:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yVfMqSBfK2/PqYx0vrefAbZn8CuJJPRDt4Z7FHHTIMk=;
 b=lNZsy6ZRl8T3jl9miUiy1DG8huWs8AoSpr2G+6tVSViQrqjFn1zJE0a/n1Ij0dEqz9
 shw148LUXm7t2bu+AdCZdr5bWS0c/6C6PuRa2vpBH2/C7PU2h9B0JnGTp9oNGByMmKU3
 NBUhdOExu3xpn1y9aPQogQcIbF2SQO+oVLwhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yVfMqSBfK2/PqYx0vrefAbZn8CuJJPRDt4Z7FHHTIMk=;
 b=PNVJ7UliI0q8s1mdf3bUddfJZaF67CAV2YwwApQkZG9AvGHY+QLi8GbczIyH0tMFQz
 hq9Xs8HLvOerjQQJIaHOqd5IW1Ekhmm3frNETF50F3M7r6+W4ISIUD9oEw1tCCFgKFbC
 xvIfUqLm5P9kyGzUToSNkP0Ux16D/dBY0GjChBG57luyFN+G84C/10e1ENH2yEsgz8tw
 OJBQOSIgcKCFn9mk0hlo2k3bQpjnKTT+kaqLAxEpOrnU8872WZl9VGyYSuUihNPhshsD
 ueIv3u13k0PCxhbMimmBCQ/++il3hln/EYuD5hLpy1pDTTtbPfCWDnz/PUpkPuGtMSxt
 wCsg==
X-Gm-Message-State: AOAM533bhYx6Xoe2Q9/+LcgoBem19vvYdtjMlLhEDytWAHRmElSpa14U
 uvv5f2XLBBF58aZPrtBNfGT3rOsLnBqmL/9X0cWa9A==
X-Google-Smtp-Source: ABdhPJypbM40Wzmt6esHRqkXVYyCEh+2x+nqmYNmzs0o++4f4iqaGJdE2IktnPmCKJxIGfzTPllPj8UPUv5oEwkJuPs=
X-Received: by 2002:a05:622a:14b:: with SMTP id
 v11mr3909827qtw.33.1619186573440; 
 Fri, 23 Apr 2021 07:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210422140945.4131092-1-daniel@0x0f.com>
 <20210422140945.4131092-2-daniel@0x0f.com>
 <CAK8P3a3fkjy2YYwhmsFQt-MSyOh=1zf1wqzQB7usjsHbUBWdtQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3fkjy2YYwhmsFQt-MSyOh=1zf1wqzQB7usjsHbUBWdtQ@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Fri, 23 Apr 2021 23:02:42 +0900
Message-ID: <CAFr9PX=QeON1C_25tyNK1rWGm3A_Kc2Ad5qLUCfunmdHQUsv_g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] ARM: mstar: Add header with macros for RIU
 register access
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Olof Johansson <olof@lixom.net>, Willy Tarreau <w@1wt.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_070256_969701_3E6F2BE6 
X-CRM114-Status: GOOD (  14.65  )
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
Message-ID: <20210423140242.9AnDbKreIe_wVv62p-s4tCmJTE_4NNNtN2GkXzvj7mQ@z>

Hi Arnd,

On Fri, 23 Apr 2021 at 22:48, Arnd Bergmann <arnd@kernel.org> wrote:
>
> The __iomem token comes after the type, so this should be 'void __iomem *'.
>

Bit of copy/paste fail. Fixed.

> > +       return readw_relaxed(reg + 4) << 16 | readw_relaxed(reg);
>
> This should probably be using 'readw' instead of 'readw_relaxed'. If you
> absolutely need to use one of the relaxed accessors somewhere,
> better add both sets and make sure drivers use the non-relaxed version
> by default.

I'll add a relaxed/non-relaxed version of each.
Because of the heavy memory barrier to access one 32 bit register
we'll hit the barrier twice in the non-relaxed version.
And we don't need to hit the barrier at all because it doesn't
actually matter for IO. Is there something better I can do there?

> Maybe both types of accessors can be in a single header.

That makes sense. I'll merge them. Would this header be something that
could go in alone without anything that uses them in mainline right
now?

Thanks,

Daniel

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
