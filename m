Return-Path: <SRS0=HiIx=GZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F41C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 14:10:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AB5423AA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 14:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AB5423AA3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cTcDMONO88z5lt4jl1FXKCBr/yhLTDDC5hL1UN+hUQ8=; b=BCKWxHBZ1v+M7gVnBSOEsi2q8
	/+Epdpge9c2kh6sSpfW7ldTSIpM+ITpTeBmMn6M3uDwhUgKGDjmB4s0Cu7jklrUffio21OJgiYHUv
	5dDMoN1ucKvGlKWCx4IWmWoJ1Nq2AQreJgFU28a8I3rOlvc9Ku/6R4iog4i99Cw3Y91OckrxIb141
	9LCMvoOLzYqCCqZ8Bh0JlNdQbNfnLg12Zwj5cLqgkpZaCXpV2quhG0GSzj6vOd0ItqyV2diiP8rjz
	RHzSXbGqrfUhq/3hJLOw9GuZl50vS8/kCNuLiarNE3IzIKZWXbBJRc0j1/gopkEUG5gvc9NspiQyz
	fBzjLtbBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2x82-00047E-FV; Fri, 22 Jan 2021 14:09:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2x80-00046t-4f
 for linux-arm-kernel@lists.infradead.org; Fri, 22 Jan 2021 14:09:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5AB4423A81
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 22 Jan 2021 14:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611324571;
 bh=vSSSLLUoXt/Vh7/CoXyYg0ulC1gSL1zZtqHOmJVt0q8=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=UeHL3TEdF+1V6O9ASHuVs65eElSO1NRmkU4TSisdGlxhl5RpMOu2r46KsYXFFK8bL
 HJcnGfAwjS9Rjul06WB5q6WpHeV62nLstSBYDeIUfc+uX4BCXsH+F+W81G4V33Ngfo
 7PZMzpN0+a5II3nRkIYoUMHgc88WTT1PqTGlrQm7oprDgct70vZj6NZQ6WlAxTXGvd
 fSHPuP+TiT+kUFLEBxFDskxB/iyElFeI59emrUCo+IjlpSBo7rYvF084HqkSrFHLUh
 I9JPfDp5MXWqwuXGccc4ITokRw3MV4AAQ1WUqYDb5+Px2+pN+V0v2hB16u7j6uMNQk
 2k8Vtj83qOgtg==
Received: by mail-ot1-f44.google.com with SMTP id a109so5171591otc.1
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 22 Jan 2021 06:09:31 -0800 (PST)
X-Gm-Message-State: AOAM533eaFkZLjJFBkHF3Hpf03vfzRH5PluqRVP4tCylllnC0Fb8f9Pi
 6EZSfrZuernWya6kezy9dKV2TnIyFc6pYqEgV9o=
X-Google-Smtp-Source: ABdhPJyekbQ5Or2Ya7z59kYvU2q/9chn0UoQbVf45yJiyTvW3r8pn08e5V6vSbp0UTxJ5mVZavWQ8SaftJdk5KPKUSw=
X-Received: by 2002:a9d:3bb7:: with SMTP id k52mr3478192otc.251.1611324570714; 
 Fri, 22 Jan 2021 06:09:30 -0800 (PST)
MIME-Version: 1.0
References: <20210121034130.1381872-1-lkundrak@v3.sk>
In-Reply-To: <20210121034130.1381872-1-lkundrak@v3.sk>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 22 Jan 2021 15:09:14 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2DYX3c-AMX9URSyrcQckY2UaRRTmnOwe=4q3P4cJ-t5A@mail.gmail.com>
Message-ID: <CAK8P3a2DYX3c-AMX9URSyrcQckY2UaRRTmnOwe=4q3P4cJ-t5A@mail.gmail.com>
Subject: Re: ARM: dts: mmp devicetree updates
To: Lubomir Rintel <lkundrak@v3.sk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_090932_251690_13FCC425 
X-CRM114-Status: GOOD (  12.08  )
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
Cc: DTML <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210122140914.vlAzwDwvkK1CthulLxVBgfSRaH0HDI7zHW3aQ90oeNE@z>

On Thu, Jan 21, 2021 at 4:41 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
>
> Hi,
>
> chained to this message is a handful of patches related to MMP device
> trees and bindings. Please take a look and consider queueing them for
> for 5.12.

These all look good to me, but I notice that a lot of them seem to be
bugfixes, so please have another look and decide if any of them should
go into v5.11 and perhaps backported to stable kernels as well.

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
