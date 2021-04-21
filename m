Return-Path: <SRS0=AlHn=JS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210A2C433ED
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Apr 2021 20:45:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 811C361427
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Apr 2021 20:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 811C361427
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pPwk77WGMG9LYWtVKnozdOUubj+4+zeC43zoes2wso0=; b=hhKIK9iB1Cpyjjnd+w6iZeQcs
	DSFQdhJSkdD2zSatFDDv6iwMpKIx7dYS7lByDgD9uCV8V326wPlynRFzA/tMiUVA+nWh+IRPv5nuf
	DeK93GHe0UpvopzG+O5OUlTF/9kTo69uno3f1ggMghPZCbeMMrZLvHybZxCUtvSSHBtm05ddRE/Fc
	jkKuFRq9RliJh24X6EpC8654Aw1KVKh7oe8ZIBxohFfoKN5jlQm842aFQ/HhfCwcCzSBSrJT89A3t
	KkkLEYXtv/lVgvYJTBLJd+evkfnYF2rlO+06VVOI/kH1L0+ot87opz7TXLVOqqaZIDuGxcllmESgN
	2HSGbbq3w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZJiN-00FAaT-7n; Wed, 21 Apr 2021 20:44:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZJiL-00FAaD-Bb
 for linux-amlogic@desiato.infradead.org; Wed, 21 Apr 2021 20:44:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=LqeeZgChcK3wdcOs4dDdba7xt3RLZI12xLEaMRltL8w=; b=RXI70PSBtknP1XYMyikr5B0EYL
 9LulDKoaY2JSwZc88ObGbiNalEsS1FYEuAqu4cB0qiy8i8lQ3Qop8cQWi+rmYOCW9GCrsTXl/qypj
 ylacFpyXd7wDcbLNwwNvyX/GmFLi/2q3vSPzAIEYMLGkbrE7eI5pseoFhQ1UFmhZO6nxlXudaDuS6
 7CqV65NTFc6DvUy0PktoEeu+Bo3J4oHAKdUcNSSVh8IuOQRhYppFRK6GxtQd0CkKQdYdkbLLXxiim
 gBdZsawrkfs1GUrjzwDKYUWr1JH0asOXKFXTUBVGk4kwTxluwnRm0LeG1FdS8JPUkXg5jS6EH/3I8
 AWhYjZFw==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZJiI-00DB9I-4l
 for linux-amlogic@lists.infradead.org; Wed, 21 Apr 2021 20:44:48 +0000
Received: by mail-pl1-x631.google.com with SMTP id s20so6495957plr.13
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Apr 2021 13:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=LqeeZgChcK3wdcOs4dDdba7xt3RLZI12xLEaMRltL8w=;
 b=ANQIhEfici6n+E6aXWErlQi26kq9j670L8srhMDBeURjitFFDdhjOPd4qFaIAEd0Wt
 OK2Ha/hO4tO5fvrDPp8l0TMsGY9JxrxRnGxmamGYVm+rWckLnv3T6nv2I34VUd3jMbwE
 Lo9qQaSooYIfOEjwciBHI0tSqaWzcs+4d1emK0JEBzTjzAItXs6pHGgDLlRh6Htotocm
 6f5gdolPfDSFXLn3YVC+9/WIY1wtztG3nHnlxDvjg9HRqGD+B84Mdb1SFHCN8d6PVn6+
 944QCofIedp+MZ1h/sJO07hF8i+W16Y5RadTZ9QxeLd1F3/rCh2/ncLmU+yI7rs8Bsnw
 zkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=LqeeZgChcK3wdcOs4dDdba7xt3RLZI12xLEaMRltL8w=;
 b=Soh4aR6vUZDqGm2DIlQ5smVku0dvi814yQ1DatHxPxVCjSNu5kVxz72Q5suU6vXD7+
 mIU1ueNA9y0LAyPvkfTT48Eiuhc8/0jzuEyqo4LW1FM3ICUIXH4puLNUVPKc1ypS8srJ
 SuUQ5QS93WX0xaOGgRvDdKjR1fnQfPcoHTU9Z7413IDdFRgJpJPhZgc3HpCeY7NOyYNb
 IK6htIKiGVSxIide1+vECUKrVsPMknnBED+bc/L5VbYwuDLc6gIlHAJnj44x7XrWbJ9L
 5jYOfUCMk9VSxwrZyvvCdR3aBi3/3asMOu8K8+Dli4NlEhHP4mSsduxV6t75rkugoTL1
 fyEg==
X-Gm-Message-State: AOAM532eUoTPiSezirg0fIJveOMHXAjl8sRyYsfk6ip/9M0D3xpYx5m/
 VUX5UMSSItD+XqW2EPF+fSMWtg==
X-Google-Smtp-Source: ABdhPJxIxAXLVcAkfgmjFPBmQheFcOxGtvyZBWfr+pibd0xIENT7Dp7m40rQgH4lvmHqtOYRBWSvGA==
X-Received: by 2002:a17:902:d3d3:b029:ec:ce64:a8ad with SMTP id
 w19-20020a170902d3d3b02900ecce64a8admr108381plb.68.1619037884784; 
 Wed, 21 Apr 2021 13:44:44 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id t184sm244636pgt.32.2021.04.21.13.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 13:44:44 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, SoC Team <soc@kernel.org>,
 devicetree@vger.kernel.org, "open list:ARM/Amlogic Meson..."
 <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: amlogic: misc DT schema fixups
In-Reply-To: <CAL_Jsq+Z2Mxy_m1QpqgFi0M7DGqMYUwZhrgk_CP7Vy1frAzUcA@mail.gmail.com>
References: <20210420230402.8807-1-khilman@baylibre.com>
 <CAL_Jsq+Z2Mxy_m1QpqgFi0M7DGqMYUwZhrgk_CP7Vy1frAzUcA@mail.gmail.com>
Date: Wed, 21 Apr 2021 13:44:43 -0700
Message-ID: <7hmttrbc5g.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_134446_254140_15CEF543 
X-CRM114-Status: GOOD (  12.80  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20210421204443.DnWHEY2yRgsCd133nSnj-fin8XwweVMZoO2WRjGd6EA@z>

Rob Herring <robh+dt@kernel.org> writes:

> On Tue, Apr 20, 2021 at 6:04 PM Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Take a pass at cleaning up a bunch of warnings
>> from 'make dtbs_check' that have crept in.
>>
>> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
>> ---
>>  .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |  5 +++++
>>  .../bindings/media/amlogic,axg-ge2d.yaml           |  1 +
>>  Documentation/devicetree/bindings/media/rc.yaml    |  4 ++++
>>  .../devicetree/bindings/sound/amlogic,t9015.yaml   |  1 +
>>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  4 ++--
>>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  | 14 +++++++-------
>>  .../arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts |  2 +-
>>  .../boot/dts/amlogic/meson-g12b-gtking-pro.dts     |  4 ++--
>>  arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts  |  2 +-
>>  .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |  4 ++--
>>  .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |  2 +-
>>  .../dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts |  2 +-
>>  .../boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts |  8 ++++----
>>  .../boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts |  2 +-
>>  .../boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts   |  2 +-
>>  .../boot/dts/amlogic/meson-gxm-wetek-core2.dts     |  2 +-
>>  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  4 ++--
>>  .../arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts |  2 +-
>>  18 files changed, 38 insertions(+), 27 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>> index 184492162e7e..db2240bad012 100644
>> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>> @@ -69,6 +69,11 @@ properties:
>>
>>        where voltage is in V, frequency is in MHz.
>>
>> +  dma-coherent:
>> +    description: |
>> +      Present if page table walks made by the SMMU are cache coherent with the
>> +      CPU.
>
> Copied from the SMMU binding whose definition is a bit special?

Oops, yes.  A mostly blind copy/paste.

> Just 'dma-coherent: true' is good.

OK

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
