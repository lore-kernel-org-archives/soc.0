Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F406C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 16:42:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB48C64F7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 16:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB48C64F7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hF170r9xwa91ceuaKX9yoJyXwXA5cKPZ1GTFVF5gu9E=; b=Y9CPGPZh6pu3MzM32NkYS4y2m
	SJcbFds8iZ2KvNec1pEUWJBvM6zTnDRye1SDN3jigMmqEmO2oIYazSLbIvacaiCFyBzmmBG4s15uT
	xo2IJBUjVUEhV1S75ijdCwqN8O0DOjNQjaZ1f2wqmR3/Yx8BsRRnA7MMEiiBLtnWiNS5Fle6MMozp
	UJoSiy9d4m4Z/51as9RrdpSlCewQ//eUi36We2SYHB+NNUn08Oihp7xHfXLVw66iCYMRAYAyYCeAH
	h3KcrDd5ShFRIBi66LEOoIKMPKdZRTQuPGENVz4YTeeASTGcKSQQkMATMto/vwmIpaNTiyPcbLeUP
	wPL4LE8RA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6ykG-0007EM-Vq; Tue, 02 Feb 2021 16:41:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6ykE-0007Cp-4F
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Feb 2021 16:41:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56C3764F80
 for <linux-arm-kernel@lists.infradead.org>;
 Tue,  2 Feb 2021 16:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612284097;
 bh=yhXL5lBZvpF2lY2jMr9ZBBLiU54D+Ml9qp/8EyRk+mE=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=jzl1wsd2gqYOlJT+Uy1RaTe3yLACURgq3qw4986GrAkAd6rwMYHmkFHAvEQb4U68A
 onTlND3uE/2wMCz6QTt9chvsw+btWV6QF2QjqnaXYERcRv7a/j+8ZZ8y3ePXUqtrv0
 Rv045rLLKEbs7+7KxDknRF07LOQx4S/hUCfi2ltcoDp94X1zC0X8wj9XX8P7oXmGZ9
 CH6Mb68sysZvyyTJN3zP52Vt9aYwKm4zYzT2ep8MW8OaHOEdKnhlYarrIWgNotHrYR
 bvUuGiABY0Y+2dLRYTDzNjF4qhOiYsH7gmuDTjsNAB6b/dOudv61fovt4ueSa/dHjC
 kRD+fKzgWMvug==
Received: by mail-ot1-f41.google.com with SMTP id e70so20390483ote.11
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 02 Feb 2021 08:41:37 -0800 (PST)
X-Gm-Message-State: AOAM533ghBhnCeuzyN2/7xvzd2NraA2CFiLZMcw/GQs2vG5dQ7vj+kYP
 JgZ+JAy46rNaxQvgBTeLegWmE3YMnyxhYuoiz2A=
X-Google-Smtp-Source: ABdhPJwRzvrw+pQxuBBZPU2H5Ytm/UMABSLPz7RWZpTRPMlCn6D6IUrv96tJ6ZL8AmQilLy5hqNEd7ANHmMok1aCJqo=
X-Received: by 2002:a05:6830:1256:: with SMTP id
 s22mr2584901otp.251.1612284096674; 
 Tue, 02 Feb 2021 08:41:36 -0800 (PST)
MIME-Version: 1.0
References: <20210121034130.1381872-1-lkundrak@v3.sk>
 <CAK8P3a2DYX3c-AMX9URSyrcQckY2UaRRTmnOwe=4q3P4cJ-t5A@mail.gmail.com>
In-Reply-To: <CAK8P3a2DYX3c-AMX9URSyrcQckY2UaRRTmnOwe=4q3P4cJ-t5A@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 2 Feb 2021 17:41:19 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2Ub0w3v_H_0F84MPdQZ28vUgxdYNii7eVY0o9a_sg7DQ@mail.gmail.com>
Message-ID: <CAK8P3a2Ub0w3v_H_0F84MPdQZ28vUgxdYNii7eVY0o9a_sg7DQ@mail.gmail.com>
Subject: Re: ARM: dts: mmp devicetree updates
To: Lubomir Rintel <lkundrak@v3.sk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_114138_364761_EBBCDBA9 
X-CRM114-Status: GOOD (  16.38  )
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
Message-ID: <20210202164119.HwJPKJ3lIz8BAyM8-YqXdz3kJuSEBb9GtrsbKAqfYF0@z>

On Fri, Jan 22, 2021 at 3:09 PM Arnd Bergmann <arnd@kernel.org> wrote:
> On Thu, Jan 21, 2021 at 4:41 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
> >
> > chained to this message is a handful of patches related to MMP device
> > trees and bindings. Please take a look and consider queueing them for
> > for 5.12.
>
> These all look good to me, but I notice that a lot of them seem to be
> bugfixes, so please have another look and decide if any of them should
> go into v5.11 and perhaps backported to stable kernels as well.

Hi Lubomir,

not sure if you missed my earlier mail. To clarify, I have not applied
any of the patches so far. Can you recheck if some of them should be
part of the v5.11 release so I know which tree to apply them to?

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
