Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A65BCC433E0
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 14:09:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7264023A9A; Fri, 22 Jan 2021 14:09:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A1E923A7E;
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
Received: by mail-ot1-f45.google.com with SMTP id 63so5166594oty.0;
        Fri, 22 Jan 2021 06:09:31 -0800 (PST)
X-Gm-Message-State: AOAM530an/iF33fOoEpoPwDTXFv4St6vXeG15Z3eXqm5qC5WctWFi+0z
	xcCH1Jpx74oFIqXyuA7ZpsqimXvG0V4pkJzbX/0=
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
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, 
	SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	DTML <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

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
