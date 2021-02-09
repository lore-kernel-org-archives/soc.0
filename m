Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32331C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:27:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBB3E64DED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBB3E64DED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cMjjwefH/BJSsPuntDRJfILWRFbbOKa7i37L7FDnEb0=; b=f1Aq4+o6t15FPU8l7h9D6acT5
	TwjLQVsqhKZWSXnR/RqbEgzc7B3crryDWwc9Nn6iFoVHNzrJR/ywjFEaM7uY3I0sPh4B1132HCe0U
	9iIiqyXsHOTUmyy42zWIJoaToc12vADulc8Ac88uy43P3LTXZLDibkGIl4SK94O7ELmj++8ELaL4u
	9UTSlSSczENW5+MIRTYLZqnRRpLlKs+tJDJ58JAGR3GEV3Hr5509auq+uhKZJa7G9wLV6F3v3w8mw
	dRBizXouWgQvprGQX46qyRneSaAYXcBIPLq3tZuz8n+SuBSmYl4fTji7aNNfZ3YP9kaXwZs0ITeGM
	caY+21gLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9cOx-0004Fv-9g; Tue, 09 Feb 2021 23:26:35 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9cOr-0004Dz-HK
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 23:26:31 +0000
Received: by mail-ot1-x32e.google.com with SMTP id c16so160213otp.0
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 09 Feb 2021 15:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IwjXZ3dkAIZUownYRrDsDZnRxOFipZhcPjf1znpQlRU=;
 b=q91+zAClRM7pyaCnLFx3MyKyH7OSxHVCSJpb77hP1+0SiR/fqGac79HrjLCaptgY6+
 Lf27lzi31zn+AJXdqJYupbclg/9XBIdSU0quV1yfIw1kKidFcATuGNt50YwFLkCR9Sxe
 BTaX1H7MWwVwg71ebPrwXplIv0VvsW1NztckZJign/UjFLsLvxZ0ylNHYQKApzED5RkY
 bCCm+LpNvgdzyq3tECg/zZJzC9K6y8se77udepdOroQ5Efyhi2WTrLtJaocE2nQtKnsv
 zQITzIU3rPEiEOva3hZ4M8wNFLh/qxx2K8hEDQqKsmZBK91un4Xxpr/0TzXFIswzAfAl
 lK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IwjXZ3dkAIZUownYRrDsDZnRxOFipZhcPjf1znpQlRU=;
 b=bnDULea7uhYWXfywv5fKaAQ9dYnysxjjV3rQJ4JeETrGhYcE7+Fo60UmuBohykn94u
 w0GhjwnVE5RAOmbvUiYUn5lLfKJuRnfyoM/G8+eDG6fSHdSx+Oa3kUoLxKqLa0MPyov7
 n53216Jm9SgvU8PxTbLkEbAU+QgpaPWkussxV7841OZoM/7VbawQTfqsbOBgqTRcrhR7
 bpDuFxFqTB52VyD7H91vAZO8HvchbYkTDxr8q1XCSsMAg0XDQqfB9ZqYji45HFlJpgkG
 0yQMP/oMxVP0UmHipbY2yvrIUUD3lHDjC05+Zmcq7OI882MGnrDP8NFC4P19RHxTUgOQ
 555w==
X-Gm-Message-State: AOAM530+Eqs4bN+5uiNMFAVj8xtL2hzXGQOdjWLHmCyeK3BpchrOX9yd
 /+Obs4bA0PZKR+o9Af/XUQU48w==
X-Google-Smtp-Source: ABdhPJwUBm3MgKUTm/uqt3L5ze0JESuAsqG9gWJMpqLjxyJ5YKUQ/ezM6jHaJ8b0gtPMlK1L69wtlA==
X-Received: by 2002:a05:6830:2106:: with SMTP id
 i6mr62990otc.260.1612913186087; 
 Tue, 09 Feb 2021 15:26:26 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id y65sm50603oie.50.2021.02.09.15.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 15:26:25 -0800 (PST)
Date: Tue, 9 Feb 2021 17:26:23 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.12
Message-ID: <YCMaH1pYhU2VH8wp@builder.lan>
References: <20210204052043.388621-1-bjorn.andersson@linaro.org>
 <161291108058.974605.13581246808545504549.b4-ty@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161291108058.974605.13581246808545504549.b4-ty@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_182630_095877_ACAEDD03 
X-CRM114-Status: GOOD (  19.25  )
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
Cc: Eric Biggers <ebiggers@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Steev Klimaszewski <steev@kali.org>,
 Caleb Connolly <caleb@connolly.tech>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Danny Lin <danny@kdrag0n.dev>, arm@kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Andy Gross <agross@kernel.org>,
 Gustave Monce <gustave.monce@outlook.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-msm@vger.kernel.org, "J . R . Divya Antony" <d.antony.jr@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Jonathan Albrieux <jonathan.albrieux@gmail.com>,
 Vincent Knecht <vincent.knecht@mailoo.org>,
 linux-arm-kernel@lists.infradead.org, Stephan Gerhold <stephan@gerhold.net>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209232623.gv6wPxcEizaj0xN6oAHwI5kIbIsZGsLjzmYegW8Lx_Q@z>

On Tue 09 Feb 17:06 CST 2021, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> On Wed, 3 Feb 2021 23:20:43 -0600, Bjorn Andersson wrote:
> > The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> > 
> >   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> > 
> > are available in the Git repository at:
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.12
> > 
> > [...]
> 
> Merged into arm/dt, thanks!
> 
> I noticed that this came fairly late in the cycle and has a fairly
> large amount of changes in it. It would be nice if you could try
> to send some of the DT contents a little earlier in the future to
> avoid risking them to miss out.
> 

Yeah, sorry about it showing up late.

I'm trying to balance it because I do feel frustration from the
contributors that the Qualcomm branches are "locked down" for 4-5 weeks
per cycle.

> It could also help to split up the largest branches to make them a
> little smaller, e.g. by having one branch just for new SoC and/or
> new board support, and another branch for changes to existing machines.
> 

It's fairly common that things such as PMICs are reused between new and
old platforms, so I fear that such a split will cause unnecessary
conflicts between my trees.

Perhaps I should just send multiple pull requests throughout the cycle?

Regards,
Bjorn

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
