Return-Path: <SRS0=VTwl=JP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C81C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Apr 2021 20:38:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 892F960FE9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Apr 2021 20:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 892F960FE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ls641kzMx5CD3AeJWb7BbOrXPlBZf/JEgq7KRfLSwZI=; b=kPQ9GaAVnpYzwQrZ4Xl3pyUBH
	mra/zLQxOREHCp8lE5INhICWLGMo7yw1i8DXMzBzQCE2A02r9hg8Ly0JPlX+FILxknwCgysfQJIpj
	r0zKPoJKBClB4q5fmgw7dYGwnB+udpDdNjXpw2GHjJqWn1HZ+NZLQslyaGTtdvByCvuNmXNbAPfra
	/YB8Qkg+0l0eyGOSp9vcEokmw4VyzpOVksKIXK/9+gLrIgc9I2coiWCYh8M5iRQmZm7du1ulj+mhA
	twJrLm9MeBCSE+v5sYFitjum3ozqkLRdcAY8IWcidDHQL55n27rkLhq+535CVA8WBGjnWZHrEPcET
	fKuV7JHNQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYE9l-008YZC-MW; Sun, 18 Apr 2021 20:36:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYE9j-008YYW-Fq
 for linux-arm-kernel@desiato.infradead.org; Sun, 18 Apr 2021 20:36:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+njT44QYZ3Qq5BMIpyAraB9HjcJytfPjL+0P2G7goO4=; b=szhXJdVRZdBLJ160wM9z86H9dD
 ZVvgXrn5CKqPz0hrjkEA0LbKt/QFvJI7wQJ4zvvM7EIFeIbBnMBztzRxtauUSDgoUDUhgsiL9fb8D
 D3w7IFECBfbJQ749LHqYr1JVXOapQtGHj0ZlYbED6moY7vlAu1A3T3zhhOs0VEORwiE7UfThMIUC6
 tnRzZhmZExk1EtnHODS0NDQ0t1TmCCSPpqZvBeU8rtHiK8ekdCw/YFGZG1rNdI672PWvF763jYRBK
 zLGrsPwgF2mr/Mc3fok+vQgHCUGJt2a4jaY6+ytfukIIYDTwe8pPbXgICaTMD3Oa92Q8A859SV361
 hzi4n5Cg==;
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYE9g-00AfLz-9c
 for linux-arm-kernel@lists.infradead.org; Sun, 18 Apr 2021 20:36:34 +0000
Received: by mail-lf1-x131.google.com with SMTP id n8so52872186lfh.1
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 18 Apr 2021 13:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+njT44QYZ3Qq5BMIpyAraB9HjcJytfPjL+0P2G7goO4=;
 b=H5jpOUO2avviyFm4AO16gHz1ThurZ5Sr2spjH3XfrubjfbM+bL3kDD3IFgWVQjuLZ8
 dL1xkh5BT25R0YBpi3tOiYULQ92WKPw8x9uHKG1XtjRnhClzw1FUzf8p7co5UTzmWip4
 8crxUP1Jigs0m9lW0LddAxJBZNmxofFj4Br6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+njT44QYZ3Qq5BMIpyAraB9HjcJytfPjL+0P2G7goO4=;
 b=ZLiyUfflkatSCx2NlfVthosqAM8FA1jlTMqXf7Ys5MpBfixhemSWsIIep9zv0lyaQf
 S88yLvx0wrmBcbndFmvNMgwKpOmfc9B4l8XJz/Hr+C6yN7EWDBKrrxlXWGCZGxCpACxg
 hyjpBgwtCpZimeNRDsYX9YePOBalQyM8VKE0D9NuLYruYgY3/+/p3JYnEl8ROOZ81K9f
 CR3Bvf5s+ffI34fZc+Ws4qKh5w9Qx+eCphBJe/wEK9LfyI5+utqje2zoQSwABdaX0W7t
 vJR1bh6PAhzeB245nmIR5gGW2ULy847fn9WBe6DairTDIWZj6UVa+raHk1cfA8g0bgua
 zDiA==
X-Gm-Message-State: AOAM531qkmZBj0HlkFa+FjuPP3OUbMhPZ02t/PMzfXkMhzkVB73KUSbK
 f9m8ciB7kdHWEpc1bSSgEzhz81kYk0HY3A5g
X-Google-Smtp-Source: ABdhPJwBo37bfjc084Jujkwr0yrkwvjcjK1nS/Td33xAdQ+9BIaMqBcAPvpfclMaFDDoNk3Rdy0KmQ==
X-Received: by 2002:a05:6512:3d2:: with SMTP id
 w18mr9889559lfp.573.1618778189497; 
 Sun, 18 Apr 2021 13:36:29 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49])
 by smtp.gmail.com with ESMTPSA id p11sm1609172lji.100.2021.04.18.13.36.28
 for <linux-arm-kernel@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 13:36:29 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id f41so29395483lfv.8
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 18 Apr 2021 13:36:28 -0700 (PDT)
X-Received: by 2002:a19:ca0d:: with SMTP id a13mr1019571lfg.253.1618778188783; 
 Sun, 18 Apr 2021 13:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3h0QDvv-0yTVOMjx-8vUUcAFTQ6di71b2DwCELHNpPLw@mail.gmail.com>
 <CAK8P3a3oQm7P=Mj2xU=8v=g82mN-OXk7yrPmFMcK0XpMpwRctg@mail.gmail.com>
In-Reply-To: <CAK8P3a3oQm7P=Mj2xU=8v=g82mN-OXk7yrPmFMcK0XpMpwRctg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 18 Apr 2021 13:36:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgNrFFVxF-9g1bjRZaG2OL4Big1_aKTMFyGagrhVNx2Kw@mail.gmail.com>
Message-ID: <CAHk-=wgNrFFVxF-9g1bjRZaG2OL4Big1_aKTMFyGagrhVNx2Kw@mail.gmail.com>
Subject: Re: [GIT PULL] Re: ARM SoC fixes for v5.12, part 2
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_133632_364285_1E4AEF74 
X-CRM114-Status: GOOD (  11.65  )
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
Message-ID: <20210418203613.1MgB8cnt3bLeWRq4Yeq10-VHplLCEEQ16orJspbuNAA@z>

On Sun, Apr 18, 2021 at 12:24 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> I forgot to add the '[GIT PULL]' in the subject line, replying to myself
> here to ensure it hits the right email folder.

Well, the reply hit _my_ search criterion, but the pr-tracker-bot is a
bit more picky.

As a result, I don't think you'll get any automated reply from the bot.

So here's the manual one,

               Linus

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
