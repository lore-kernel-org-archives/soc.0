Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED72C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 11:09:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A7EB61056
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 11:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A7EB61056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7i4JYTQjLNzZOv7emqg464zeTkQyk4N5Dd8K45vM4IM=; b=iWePezWU8wLMYoB99G625+tIk
	cokFJ/gRht8fK3aDiqVqWnnzpPkOjgPuXVI+tioh1vRiknZBUgvs/syQ8Ujf8bIUwp44bxT6lVkOx
	xDs2r6YY18IZT0+EhJ7dXFQkAmanzQuLqIbRCYmpDdEn+BaKRHZXlt50kg2lbHreTdj5l9YnIBzBj
	tKb2ul8UmqMMyeEcvZlH3hAt+J9/LdStb6geJpPlad8qcwTf+gCBUIx0kSSBxdJNN/zuDO/biVts+
	d4AXxvmF97/DQJP2AVphhCjqiSKVte7xErvELdGTrkBs0aP34QAgVsCP7ioC6Btij1dkblXU3iqVs
	losy0W09g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRvAp-009KRD-0y; Thu, 01 Apr 2021 11:07:39 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRvAj-009KPF-IO
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 11:07:36 +0000
Received: by mail-qv1-xf30.google.com with SMTP id q9so773875qvm.6
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 01 Apr 2021 04:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5hr4EJfC6Dy4LxB2ks0ND142hkf8rNwvgR5bFJx1My8=;
 b=IwfvFudKaG7ulKrhClM3/mRjUThVsffOd8fFnuhBPUkS35EDofF6DoNmO2uJl0ZJe5
 w9rFM1Svm6WR0jHPftrVEjfPU1eMR2oS0EwmA/dpM000mgQHQyWSWOa00XbSoRkoTy9a
 AmV8tA/1UITRcKRQzP+3RAU311ay+sDi2dTLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5hr4EJfC6Dy4LxB2ks0ND142hkf8rNwvgR5bFJx1My8=;
 b=T/omtmUzuCAxPwz74kvP7lvLtQgbVezAxaCZocWydhuONF2wEpWe0YQq1EbqWf6qWd
 K3XP2mS81RD9C4zpyzU9dvxHw5R3R9AymsPmwbiSIj5cUSe8e7fAmEFahTFIRnu6oTJQ
 AcNAEtjuZdlWHqg9ALtZH/nPmnlRer/Yn5HyPf9tLXj7Os8Vm9Z2z4esLSEjLO9mTZDB
 ew3r6qUyZVTC+5eeyP1lzYxXE5avucpqJsKoSkM1oyQ05iUHup/zVsorFx+O6D2c5E2v
 UcntgIEcveBttw4WPXfTMipQ9hrdIbEbT151qtHY8IR/Q/MC7tnycOvPDgOnTnV5hE/e
 m6pQ==
X-Gm-Message-State: AOAM5333iWghkGTqsD/y3a1QouW1DNJhatYY8Vf27S87FK/ZgV09I/b4
 hZPXeSo/opDHwQr4prjmcglVNLkFye1MrgRCSuVbrg==
X-Google-Smtp-Source: ABdhPJxPeLgGNYuUVol7wcn3UD700JCejRwjzkrn+bZT/fTLQdwdf0L0H88XiIRNF+6k69uJk/9V3D5PfwQ6HMp9Q6E=
X-Received: by 2002:ad4:56e1:: with SMTP id cr1mr7615297qvb.25.1617275251088; 
 Thu, 01 Apr 2021 04:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210223061830.1913700-1-daniel@0x0f.com>
 <20210223061830.1913700-2-daniel@0x0f.com>
 <1614108850.540354.4116103.nullmailer@robh.at.kernel.org>
 <CAFr9PX=h2JPdAwjYS2849ufH=wnxSti2Dj60fbq4bg8b8=xy_g@mail.gmail.com>
 <CAK8P3a1L62YT1WUxmmfLNmvERo7DbeVwfCHCxuKvxs7Uap+iXg@mail.gmail.com>
In-Reply-To: <CAK8P3a1L62YT1WUxmmfLNmvERo7DbeVwfCHCxuKvxs7Uap+iXg@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 1 Apr 2021 20:07:20 +0900
Message-ID: <CAFr9PXmT-FUUu-yMBWCe52KDHUSF2+Zhr8wk-NdC+cW+_8prKw@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: clk: mstar msc313 cpupll binding
 description
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh@kernel.org>, SoC Team <soc@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Willy Tarreau <w@1wt.eu>, 
 linux-clk <linux-clk@vger.kernel.org>, DTML <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_120734_101151_6272F7E7 
X-CRM114-Status: UNSURE (   9.42  )
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
Message-ID: <20210401110720.ii5ZtivAjY7C3qtCzndSnDDBassPbBkBWaltJeQvg58@z>

Hi Arnd,

On Thu, 1 Apr 2021 at 20:04, Arnd Bergmann <arnd@arndb.de> wrote:
> I found this is still in patchwork as not merged, and I have not
> seen a replacement. Marking all eight patches as 'changes requested' now,
> please resend.

Understood. I will resend.

Thanks,

Daniel

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
