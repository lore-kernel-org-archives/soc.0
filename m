Return-Path: <SRS0=tGbD=PM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEFBC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 23:18:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2350960C40
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 23:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2350960C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qlNFQGyleSATgzvPXGafyi3egpDlRFMbfAHlbHLVxG0=; b=TuS9CzLYxz6r/t
	Mhs96NU05ZZ7faUysBv/1+ofjmm4LAnHgnAM0WDU1H9/47ZMac6BPC78qFDwPURQAfHxIDE9vUh98
	9Zjy8OQoYHe7VliUHmbqTx01fTEwglzdMeJjSRY1l2fhGhKQIM1GcYExDuPF7MvJhWl0NIi76d01e
	l69lD2j6BCtdy8oipvZW7hyCUd54mF6pBHw5lv+4J1Jkc7ju/ZBpUmYbx9+3ttnJlw98SoS/gNelG
	LlXo6mtuM7HTNfn3jDw8Nn17ayYAb3E1u0A1Vfoxhp9ZAMnPyyURT4CyrIORSvGslPekNtmSoXPut
	IHg4goovYrDYTNPB7R/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1memjW-00EkwU-LB; Sun, 24 Oct 2021 23:16:54 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1memjT-00Ekvl-61
 for linux-arm-kernel@lists.infradead.org; Sun, 24 Oct 2021 23:16:52 +0000
Received: by mail-lj1-x229.google.com with SMTP id 145so4974325ljj.1
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 24 Oct 2021 16:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7c8mDt5oU6grN/T27nlrN9m6S6mPoCForSkLbFys4hQ=;
 b=qm7X+j5P9wG5YV6anbu6txrHkdOtZrGzk1C5p/otJ90cVX2ViknRy63w2NST+aK1KR
 hkoVJSSE3lZuf0IZNeFIa9IPBtST8cTG0ssSFn8w9HJxBH1ovF4L4LKUgzMNMhIcVI5N
 xjyPA2x2ZyLJO48lKunCAsA1/4dlkCPMgmr33Ca4OvKlrQhE1Q80eSmJiMl44JB1OcES
 ePDBF+TAIkwyohEzFmh9rhkHXh3zOWpLjt0ngdsPfCJqolFqoaEbXJAGg2tw4s6BVj3m
 LIhEyxrkGLPhWF6Z7eTbNFsG+PT3F8nO9H+KqXGqKYn80qN11u4xRFnklv1rcGffqZQg
 vMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7c8mDt5oU6grN/T27nlrN9m6S6mPoCForSkLbFys4hQ=;
 b=xlbc9q+SY1JfrK7emrtfcvHZK7K32JxUiXQgZCsQ5m+OzyF4ZLBaAmh2L6u7dVRhUj
 dAax84sD7sYtY5AtEHg5CDYGdxBJEYqNBlvuWNkxwGMHAEDH5kUBYOqIgGljc+rWvIQn
 EmQBvA2+fJANYFsaJnRCuv6uUnkvVLCBP3HDN+cUBUExV+VUTCIdUjoqGrA3zaB97+Un
 +vwRD1IFInFz6X4xDdXVnPuqbjawLJd4+3AdTeNwWXN1Y66AXOlyO5qpjW1EfvtaYXEE
 iXMMsFSF+L2WEW1fZXq4Nemq1AHTziunZj9i5ajmcn9LfERw/QV6aLFppAD0tIrHcr73
 O02g==
X-Gm-Message-State: AOAM5302FeNGa7m6/VCXzFlNPgQ8x456hdmM+vekPVLqqK/4OL0EKgE7
 KO0g3c03Qj4NCVPphcqU9/JCJZ7x3QHk8M5gbaz/wg==
X-Google-Smtp-Source: ABdhPJzK8HuLWgNka0Gsm1lpjg1VBs6Cv75aRPFmVlFmVh5ohfE5x4WnvPYnpbTcdht3SFLyy7pXW+rG7G6BNzLvJfo=
X-Received: by 2002:a2e:98c5:: with SMTP id s5mr15404100ljj.432.1635117407175; 
 Sun, 24 Oct 2021 16:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211013143810.2101838-1-arnd@kernel.org>
 <CAL_Jsq+WqboHoqHN-c5KAWPzMZm3dgExWr8RT7+-5bzwSA5BUQ@mail.gmail.com>
 <CAK8P3a1SreOdJ=jMvRYhwyWhTdEOBMzW+AFX2bRztRStrDWVLw@mail.gmail.com>
 <CAL_JsqLyLOK=1HwirRmA+FwyfZckzodqT08Qy_KZz3-WPN6Zsw@mail.gmail.com>
In-Reply-To: <CAL_JsqLyLOK=1HwirRmA+FwyfZckzodqT08Qy_KZz3-WPN6Zsw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 Oct 2021 01:16:35 +0200
Message-ID: <CACRpkdYe_f_iS9Qu5D63bSfH8+sFU2eHrbqTgiECo53s0VL3jQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: versatile: remove leading 0 on unit address
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Liviu Dudau <liviu.dudau@arm.com>, SoC Team <soc@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rui Miguel Silva <rui.silva@linaro.org>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_161651_252033_1AE7DBE4 
X-CRM114-Status: GOOD (  11.50  )
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
Message-ID: <20211024231635.xLZqJPdWoATLXeiSBrIM_dBcv5SCUq3HS7wZ9jzhXTY@z>

On Thu, Oct 21, 2021 at 11:10 PM Rob Herring <robh@kernel.org> wrote:
> On Thu, Oct 21, 2021 at 3:49 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > On Thu, Oct 14, 2021 at 2:53 AM Rob Herring <robh+dt@kernel.org> wrote:
> > > On Wed, Oct 13, 2021 at 9:38 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > >
> > > Please apply these instead:
> > > https://lore.kernel.org/all/20210913192816.1225025-7-robh@kernel.org/
> > > https://lore.kernel.org/all/20210913192816.1225025-8-robh@kernel.org/
>
> Linus?

I don't recognize these patches, no idea why I have missed them :(

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Arnd, please feel free to go ahead and apply these.

Yours,
Linus Walleij

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
