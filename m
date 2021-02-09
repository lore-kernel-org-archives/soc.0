Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B25C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 19:21:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0129664ECF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 19:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0129664ECF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TdeRO67k1nVPjw/QF0A38qTbNoFCkeB6pu6dKUuHcns=; b=cfr6J/9OijbXpo0k/A7w8FOIK
	9jNvj5afPznPLqSoEiAfol6BoQC7RKq6EWEymvwhNEcyffrz3YDNWujl4MuBffrflh2zhXloKzQts
	8kAL8TfPSidf3p7QR749lsF9AbzxvXMqKH7oiKPbZADm/RH9nOhZvnVM+dO8BzHyLYVv1IGg+BIYh
	joNb0COo4HBnqaFVzlGCvtsAYS+vKHQxbkyduOPOx6gd7GsiZp+6P06x20IQ1eyyE2O21g5Bi4pkE
	4mzgJcCX/XhGJIydRe7nj12b+ZUzOzBSjrCumf8vzlyMg0XFjFBxLNSJCq61Ab0SwgzW+DvNIFLDX
	/RBLfCmKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9YY0-0004JY-J2; Tue, 09 Feb 2021 19:19:40 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9YXy-0004IX-6B
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 19:19:39 +0000
Received: by mail-qv1-xf32.google.com with SMTP id j4so9240065qvk.6
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 09 Feb 2021 11:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OfTABNqV2/dgIczcIGpTslZ48bA8VW7hHVaIj/4GfsU=;
 b=JkitmTFeJmEERO+haqbix/PAz2MfSvvtnk7W6zSTIxx8Y+1tUVd7r7IiNoMLcH3HW3
 YNXR0G3VK0SEMJEEyQTjuybZ2b/IA5HGgyp5sGkrSKp0pInvOBcK5SXM8v+gbwmjFWgi
 KHiXvShvgfeddE+EdtdTz6b0HgrJUD4zyeuxAHua2aI5modiGThykPiddh+bTQ9FMRVP
 1NcJCEVQs+JM3zzTMXzBWrqRyHy9wwGVUvQK1Sea2dGWm066uCVSFkx8S8ycMr1zbHuN
 B+MK7U+rmeAhaZTqNTrq4axpyLWd6FpngeUAd6J1SPe746dDnOCwKgKUnYOH/vbFBtcP
 dmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OfTABNqV2/dgIczcIGpTslZ48bA8VW7hHVaIj/4GfsU=;
 b=KctzWimHQyu/s1vQkp5D9Buq+WmbsWbhn5s9emo9EIhbxqhYd0Qu3Y5S4HZGLe3kw8
 D10tN/P0ysVTR2EvPu95cLvss2EMY3FD7ozI9S1AQTgw0LTgLuu+oKPIT3jwq/rHie8U
 32Xf+ZitL9dtUNddIiyNQhQl/hldeBE9Hr1PG5j7JW5v5HphKScVxsvUj5c8aKF46GR4
 rLY7ykOCIAvKq/aV4b8OHZN/M+/7llSdsmpOnn6qCUDYi7U+gzW2XebUmcUegF4WJVzU
 53oGCCq/049UB4usII+B3ydJNgPdeLAvlTD0Fy2kPyhB6kqM0TX+PqPSZ0Ru3Ftf8m8+
 hazA==
X-Gm-Message-State: AOAM532z2Z8Ape2THrQOrSNv/JuRyyAjmtM27h0sfF8pk6N9+4nb5Ny7
 8kuLLRdfbF7/xj3ag4cic4U=
X-Google-Smtp-Source: ABdhPJxwpTfsaltd2sTJ+PIvZKKbEuql8jMNGKrFTE7F39NpOxjAuHsIOjA6wv1M8yFV/SlghlllTA==
X-Received: by 2002:a0c:9e50:: with SMTP id z16mr21934994qve.13.1612898371968; 
 Tue, 09 Feb 2021 11:19:31 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net.
 [67.187.90.124])
 by smtp.gmail.com with ESMTPSA id v1sm3558596qki.49.2021.02.09.11.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 11:19:31 -0800 (PST)
Subject: Re: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
To: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
References: <20210125191240.11278-1-krzk@kernel.org>
 <20210125191240.11278-3-krzk@kernel.org>
 <20210206134531.l5vpzlmev4v3f3uo@kozik-lap>
 <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <67970952-e048-efbf-446c-a703da3bc037@gmail.com>
Date: Tue, 9 Feb 2021 13:19:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_141938_255597_0555673A 
X-CRM114-Status: GOOD (  38.13  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <snawrocki@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>, arm-soc <arm@kernel.org>,
 DTML <devicetree@vger.kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209191929.ZmzJiclPi3anLxN5vNbBjwkVuGa0r1ilpZWKEYs1J-A@z>

On 2/6/21 8:35 AM, Arnd Bergmann wrote:
> On Sat, Feb 6, 2021 at 2:45 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On Mon, Jan 25, 2021 at 08:12:39PM +0100, Krzysztof Kozlowski wrote:
>>>
>>> ----------------------------------------------------------------
>>> Samsung DTS ARM changes for v5.12
>>>
>>> 1. Use new compatile to properly configure Exynos5420 USB2 PHY, fixing
>>>    it suspend/resume cycle.
>>> 2. Correct Samsung PMIC interrupt trigger levels on multiple boards.
>>> 3. Correct the voltages of Samsung GT-I9100 charger and add top-off
>>>    charger.
>>>
>>
>> Hi everyone,
>>
>> Any progress or new comments about this pull request?
> 
> Hi Krzysztof,
> 
> Sorry for not getting back to you on this earlier. I discussed this with
> Olof the other day and we decided to merge this, I just haven't
> gone through the pull requests over the past few days. My plan is
> to do the next round on Monday.
> 
> That said, I'm still not happy about the patch we discussed in the
> other email thread[1] and I'd like to handle it a little more strictly in
> the future, but I agree this wasn't obvious and we have been rather
> inconsistent about it in the past, with some platform maintainers
> handling it way more strictly than others.
> 
> I've added the devicetree maintainers and a few other platform
> maintainers to Cc here, maybe they can provide some further
> opinions on the topic so we can come to an approach that
> works for everyone.
> 
> My summary of the thread in [1] is there was a driver bug that
> required a DT binding change. Krzysztof and the other involved
> parties made sure the driver handles it in a backward-compatible
> way (an old dtb file will still run into the bug but keep working
> with new kernels), but decided that they did not need to worry
> about the opposite case (running an old kernel with an updated
> dtb). I noticed the compatibility break and said that I would
> prefer this to be done in a way that is compatible both ways,
> or at the minimum be alerted about the binding break in the
> pull request, with an explanation about why this had to be done,
> even when we don't think anyone is going to be affected.
> 
> What do others think about this? Should we generally assume
> that breaking old kernels with new dtbs is acceptable, or should
> we try to avoid it if possible, the same way we try to avoid
> breaking new kernels with old dtbs? Should this be a platform
> specific policy or should we try to handle all platforms the same
> way?

The current policy (since before 2013) is that newer kernels,
implementing new bindings, do not break with old existing dtbs.

Old existing kernels are not required to work with new dtbs.

See Documentation/devicetree/bindings/ABI.rst

We can choose to change the rules, so I'm not saying that the
discussion should not occur.  I'm just pointing out the
current policy.

I think that ABI.rst does not state "Old existing kernels are
not required to work with new dtbs" clearly enough, and
should be updated to do so.

I also think it would be good to explicitly say that care
should be taken with new bindings to not break existing
kernels, if reasonably possible.

-Frank

> 
>           Arnd
> 
> [1] https://lore.kernel.org/lkml/20210130143949.aamac2724esupt7v@kozik-lap/
> 


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
