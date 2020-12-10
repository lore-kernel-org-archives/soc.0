Return-Path: <SRS0=rNyZ=FO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E099CC433FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 10:41:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AAFA23D6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 10:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AAFA23D6A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JR+tAlC6AN0hjdujtQ9kbIsUNdVRGyNEmlJ/C4h4bX4=; b=vl4xU7HT4uN824ncGqsuZ2kuy
	EzmV2nd4B9F2srIwVwK6gkbmaDfpGGmZOuJiwcrZLnxjPno1Ck6pFDhGKnRBNW/1Vv1el4tUV6NXA
	bxesBnF29nWNGAclaO36xoob23oiwLb00Xj+erk6y/t7m07MDkXDrtOtIN1qBYQNdEeP1Yy/M3U0H
	4KJAI9razayGA1gpH7Q4/YdBLVbMgbFNbd4pK7P6Q2fEn2JJ0GsfD0uqGXIhnEGLZJOvKJ4mYFacj
	OIdn24sYQaHtHYBITb3BAZwq6djxPlaS8t1EhKMJOdM48Yq2xArMHnD9MmZKUmLV/m/GJAMemKHLI
	8qImRrTGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knJMd-0001Cj-AE; Thu, 10 Dec 2020 10:39:59 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knJMb-0001BT-Dn
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Dec 2020 10:39:58 +0000
Received: by mail-qt1-x844.google.com with SMTP id b9so3263242qtr.2
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 10 Dec 2020 02:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L2WFU4dR05ZGB+4ahSYpvkou90km6wj3qFHGpNOIG9M=;
 b=ZCaNzYwl7SUQuyXA717WC7IZendW6N96htJ/gjKsEIGCoZB1Ol2tjYR06fRUijr3FA
 5ISU/OS7u1Az8OZW/eMNZ9OyMnXLIt3fQebq1fqezHuUQvqK9+KckKMwxfVmd83nO9V/
 Kx92pP+6KrpJnV69lBueCksEBq0CNg/B/GMhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L2WFU4dR05ZGB+4ahSYpvkou90km6wj3qFHGpNOIG9M=;
 b=sJ5ui17IuX8frxrO+ZkPgkqjy4qODPfAaVZPm5oVuvG2aJGJJvdoql8wirUma4h6VG
 S+l6PMbFrx3ABFnHzES5BRSLCChN8k/PWzexWzn1RL+SEVH6ndFaO8eImvdnaG+LxG22
 K6pvykiwMqrLxpRdRxHDwqLWk6Cqde0rA2afRSt+StgtdBXIMQzDfk45dM1YjB0dm7Xv
 qWeJq6m2wdBfjE/ByTFPpv4lANQBTwoZf536SRMGFtfZfWQ400ZvS1LB+PlBqpm1Rg12
 u2FwrluSfbN56poG74jvkRNYjn/g1F1ErFuAn/KUcBu8ydmEYz3/hwIZ3GFKVK/xQUs4
 TBeg==
X-Gm-Message-State: AOAM530TQ48O2mOatb2meunxgwNl21kVafRSP80NwMPFdUMVDpgOJleK
 Jb1m6tdoiGzH8iBuy20RCEK3oU5hZOK+PAtJLeLx/tjk1rU=
X-Google-Smtp-Source: ABdhPJza71bHTJCiyvRTTQ2YNcpXeu9wyUFDyS+bpZT9AnvgoplhU3GXEc+KIUKkz1TdBEplvPh0gJR6E49WgL8pWZg=
X-Received: by 2002:ac8:5647:: with SMTP id 7mr8312313qtt.148.1607596795854;
 Thu, 10 Dec 2020 02:39:55 -0800 (PST)
MIME-Version: 1.0
References: <20201201134330.3037007-1-daniel@0x0f.com>
 <20201201134330.3037007-3-daniel@0x0f.com>
 <20201209163409.GA566058@robh.at.kernel.org>
In-Reply-To: <20201209163409.GA566058@robh.at.kernel.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 10 Dec 2020 19:39:45 +0900
Message-ID: <CAFr9PXmwOEuHHA-kDeL1YS8bWvovrt43MXxyy1J+hGbXwPUFSA@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] dt-bindings: vendor-prefixes: Add honestar
 vendor prefix
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_053957_496404_CD3C5C65 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, olof@lixom.net, Willy Tarreau <w@1wt.eu>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201210103945.MbN-Gk55g3Jb54Ajkinoo8B-GtFZN2eBCkF4fwl-Ytk@z>

Hi Rob,

On Thu, 10 Dec 2020 at 01:34, Rob Herring <robh@kernel.org> wrote:
> > +  "^honestar,.*":
> > +    description: Honestar Technologies Co., Ltd.
>
> Alphabetical order please.

Sorry about that. I intended to do that but apparently don't know the
alphabet anymore..

Thanks,

Daniel

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
