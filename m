Return-Path: <SRS0=xpWt=HN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7700C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Feb 2021 11:53:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67E3564E6F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Feb 2021 11:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67E3564E6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=goR5wQvetrD0n7ohd+5XuBW3TAop5Fgzdg3Cy2g6MNI=; b=XKtshq/1CbPrQFLlNDGYeLLrB
	/4vpjdp2whIDiRUbLpiZrxrfS4ho0aYCjlvkIFnVt9kWKEzWmeYjFZvkJB1XBhBDa0WqEcC7s4Q6j
	UwMI8qzwzr2Q4/GUA1yhVZYYzpsuApeW2B0PHhPH/Nl1NZCCYcIOhWFF5eyZl4C8wbWjEqXfh00Za
	eGyKKj+TMKuPkAuPmjC9WVJFtthoctereW0o8vO5FF90yxVYDI5gH7fhQwNfO0CM+zn01M/rzCEIp
	Qx0IBn0dxoWlYG+UuV1hwDh/kOjTX1rQtgIxUPNCUEntkjdoMQf5eVgm9bM9nMU3dnO+EVZS8w6A5
	fhdbkkPSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAAWV-0002Pi-Bm; Thu, 11 Feb 2021 11:52:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAAWT-0002Oe-Av; Thu, 11 Feb 2021 11:52:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E37464EAA;
 Thu, 11 Feb 2021 11:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613044356;
 bh=PBeGwLjGEVNJ7GvWXwV/HotbITgDYxhkIawMCH+Lrbs=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=UWUJO+bsvWVj78WCD0fvipRTLnOXddNZEaQduxHnMCUXe77oubK0cIAs9RDYceIvG
 cooHtk01MuGnQsKy5R9I0hwrTPTpmTc3bOU2jsOakaZzwz9PZ14g9XY92xu9EroeDz
 86Pae8VNn9oqBg72oBPh8UzbLdSaaxXvC8WA9721EJmHmJZiXOdTQ6tHGSRgN5jKYt
 m/56TcdYnvel4dhiyjVJPnxd8M4BKBTKfKZgm6O6+UHTj7f5GJ/Hcu5DiT2+oSNbmS
 6LITPe3qmLaQFJQD13hmuw8tozlRoV0LRNo56kNCkMlu25moBI2ycn0Waxp8Mk4RsU
 BMoejHV7l3gCA==
Received: by mail-oi1-f175.google.com with SMTP id v193so5719735oie.8;
 Thu, 11 Feb 2021 03:52:36 -0800 (PST)
X-Gm-Message-State: AOAM531Aj3KdQv7qHoCcmbB2rI/aTk+RX7iwaMnmN8Ox599eis4lO54S
 EY38pMXnnaVnZtXVKpSuOwcX+Dn9EU1B8H1w5To=
X-Google-Smtp-Source: ABdhPJzGRc5cUize8GW1KygKY5QB0/6HYJu2d/5NJ6GASLOCiQXtKEwJmHvgaTx+l4EO/iyAwaQnn0uo6oHda0i+L3M=
X-Received: by 2002:aca:e103:: with SMTP id y3mr2307802oig.11.1613044355483;
 Thu, 11 Feb 2021 03:52:35 -0800 (PST)
MIME-Version: 1.0
References: <20210210190506.1923684-1-anders.roxell@linaro.org>
In-Reply-To: <20210210190506.1923684-1-anders.roxell@linaro.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 11 Feb 2021 12:52:19 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2ysNApoG2FDsLdNoWA7nPXvzLMzkjXWdCig9jaSWwuKw@mail.gmail.com>
Message-ID: <CAK8P3a2ysNApoG2FDsLdNoWA7nPXvzLMzkjXWdCig9jaSWwuKw@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: enable modern virtio pci device
To: Anders Roxell <anders.roxell@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_065237_473504_5F916949 
X-CRM114-Status: GOOD (  14.61  )
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
Cc: Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-xtensa@linux-xtensa.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 virtualization@lists.linux-foundation.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, SoC Team <soc@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Jason Wang <jasowang@redhat.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210211115219.pAvepMIxsMBlb_a2krtxXjh0LJGuHCZyliq1ebKRmc4@z>

On Wed, Feb 10, 2021 at 8:05 PM Anders Roxell <anders.roxell@linaro.org> wrote:
>
> Since patch ("virtio-pci: introduce modern device module") got added it
> is not possible to boot a defconfig kernel in qemu with a virtio pci
> device.  Add CONFIG_VIRTIO_PCI_MODERN=y fragment makes the kernel able
> to boot.
>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  arch/arm/configs/multi_v7_defconfig         | 1 +
>  arch/arm64/configs/defconfig                | 1 +

Acked-by: Arnd Bergmann <arnd@arndb.de>

Michael, can you pick this up in the vhost tree that introduces the regression?

         Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
