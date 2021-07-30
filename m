Return-Path: <SRS0=BD2L=MW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7DCC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jul 2021 14:47:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B64660C3F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jul 2021 14:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B64660C3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CD0ifbjLzmU/c0KyyJW8eaprsbZOj4fwl84TW1NmbdE=; b=fBtgs1A6/WgD1J
	JMvi6ZG7ahTL2DKEfsEwMgPKnED8YXwW4oxI0J3hHxaGdDTdreSBnqHfgWiu9DNO89mFV+KgWVx7r
	Xu0rdWrD8EBzhFwKv7q80am7/7ALEUXwrrRWhTftvBC1La3PcNIEpGxGtnP/DHLw6Zikj/g7SOCc9
	N9qKqKRuks5nPMeADy1U780AXHgbaL1qkc6/8hzZGnUWWBUxDSE+W4kg0+UKjtOuLc+JLYrUejEnH
	TX6jP0D9Cr1vkklSr2Px0vSqfXa9BHlQ76Q6ktTQs30qB2njcwndfCJGt751o1wBDIy1rJ3Y7lqC3
	PQEfu2zjEOnhwtZtcHaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9TlK-0091E1-Bk; Fri, 30 Jul 2021 14:45:22 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9TlG-0091D5-Io
 for linux-arm-kernel@lists.infradead.org; Fri, 30 Jul 2021 14:45:20 +0000
Received: by mail-qk1-x731.google.com with SMTP id az7so9623576qkb.5
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 30 Jul 2021 07:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zIFyuAd42T9MX3qAoYpiIH7RLSS0/Rx9i9YWLtwvrgo=;
 b=MZMNdU90T1mdr8f+FlrQaQK/8xRSpuWb+VLJYY04eQAnQjNSfuvvE2QrwqSops4AMK
 YoYRYQLiThc0bxkrK9iOOdLLSyRaxse1aXajornOiRMRdWKS5p4sY2rCHlwWqgP+HZyz
 zkt6k0YfRmN5zyErzIxLsFY5wJEXsdX68OBlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zIFyuAd42T9MX3qAoYpiIH7RLSS0/Rx9i9YWLtwvrgo=;
 b=g14fhdpcU4oyvBE/wswc3rzZqjM16vGNRH8xSr1pdY0wj4ByhVUt6aANz3mNl48UwG
 xWWgwa1UlX4PbgN5biIbPtFTR9dPIIlH9y1rPEQvPPqo7nqigCArhvnVkbdGI1cMt1ej
 WPIZpDxjyXniZspzfVgAwdVPqfyaxtv0PcsN6JIzBJfeB0j6EX6lC/UvpwNRysN/DosK
 u+noLGAfTaGB5+SqXX7wV32xgAGtAF+WRIlUxV9arbc0+Fox4ugutYNQ1Waq/FI+UWgS
 BtktNCV59/Q+VDA/gCb3NP80sBr5xyu9wVQyQrd9iGzlxE5nZBeQweSjjwGzpbqH2wP3
 QG4A==
X-Gm-Message-State: AOAM531NawkpVfp3qAgEbZRT/JRXoOfpNaz5OK0GmmorXnBar/KPjFBk
 LDp1s+5yUyF8fZ1khs6uMAm0fFJ8qNxWKj7bgFT3iA==
X-Google-Smtp-Source: ABdhPJyz3l2sQZ+SSXfddd6sETZFkOS5YZXDtdPgdR5B3eaKCu+XhEgm3upVc9TljLMB6v7V3xiiVDe05DNMJPnsckQ=
X-Received: by 2002:a05:620a:1242:: with SMTP id
 a2mr2651740qkl.443.1627656315951; 
 Fri, 30 Jul 2021 07:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210730134552.853350-1-bert@biot.com>
 <20210730134552.853350-4-bert@biot.com>
In-Reply-To: <20210730134552.853350-4-bert@biot.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Fri, 30 Jul 2021 23:45:05 +0900
Message-ID: <CAFr9PXkHfncDq=XybcTu-W=Q0ieFRSP5vvSk1nNz2F3jfoS50A@mail.gmail.com>
Subject: Re: [PATCH 3/5] ARM: dts: Add basic support for EcoNet EN7523
To: Bert Vermeulen <bert@biot.com>
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_074518_765463_28C2F956 
X-CRM114-Status: GOOD (  10.23  )
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
Message-ID: <20210730144505.OwDTNIq9Vp8Ooo8dzZBuogCaC0ltefCIMxaDkMA19tU@z>

Hi Bert,

On Fri, 30 Jul 2021 at 22:53, Bert Vermeulen <bert@biot.com> wrote:
> +
> +               cpu0: cpu@0 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a7";
> +                       reg = <0x0>;
> +                       enable-method = "psci";
> +                       clock-frequency = <80000000>;
> +                       next-level-cache = <&L2_0>;
> +
> +               };

Super nit but looks like an empty line snuck in here.

Cheers,

Daniel

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
