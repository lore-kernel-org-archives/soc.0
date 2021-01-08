Return-Path: <SRS0=l7M8=GL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6467C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 13:27:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C764235FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 13:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C764235FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JMqwc4f2TfRjxoz1sssu1YaiS/0cXvGzbCKl5/1dCpU=; b=aDNkEf/tRTbckxkq5OSMlaUp8
	J6CGnza1PpTI9bJwgrRFz9aCspFHKQvMatxArZOuEh8qReC0E/0XhFQtxBNbb3SQvDSjHJ9A0g/IC
	F6XbdMVVJU0fSISHRymkBN6le67axbFHUJP8uyGeB93H/Bn9oJddw4pyLF0XW6ofUrZBrQh7Ru06k
	CBoY0dV9Cvv6wftFPuzfM5mxBN9Dwa3SXOvvpBvmTjhkq+eHDlyGG4tyatZVYuI91pF4dbaYkJhLh
	vWnQycZ/rdIX6DCzD58wRIHALGEnL9QGl61fAuADeMWYUy++HzwGOU89bqMUx8QtA26e/srrzyMyl
	XsnMr58Kg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxrm2-00081U-Px; Fri, 08 Jan 2021 13:25:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxrlf-00080U-Rj
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Jan 2021 13:25:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D69432396F
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 13:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610112327;
 bh=VcRV33p0SkKTn9rguv5A4ssyBu+kLEWSBXUNimM919U=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=Vi9eWm5JFShpbEfCPhCeJ8v2xM5Tfh1ABh6k5od2dRtLw73VeqroDaW6ZF2SvPdhD
 ZigKQ3JqteqVkTisDdLJepNuTuZKUAI4KArKamQAomkKhJIDK+qQRdrU4mn7a09N3S
 aWo9wsc3j3G73GUFt+XYyHUXJTV+vkB1InJHOz8ARvrVVPRYUo6pOSlHGLwVB+W80f
 Uah87mD1shTGxt6JKXSeP9J0H2+FMq0kYhYQGqCzThF0b4996FcbBmup+fF5tvsYxM
 H76CcmOIyfiKkl1jR+RczWQWERrBTpvSoAXffxniybbytw5vOz50asX5D8H/ghDOAc
 Od0KQgG529Qdw==
Received: by mail-oi1-f171.google.com with SMTP id d203so11359534oia.0
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 08 Jan 2021 05:25:26 -0800 (PST)
X-Gm-Message-State: AOAM532ZmTrFgE34FjTraapdDRDB7yulS+W4FM7m8vpTnLbsHE09lZHV
 TsZL2KP9K4epAv7/Z3shTEjcEFxbLohrS7/MLTM=
X-Google-Smtp-Source: ABdhPJzFTHVAWCfzExdXXJfB4IT8mh06IJ+YPPJMRSSzo2Gqhb/3BZehi2e9sLq3sp/pdryBG/5BKZqI/DlBR98+W1k=
X-Received: by 2002:aca:e103:: with SMTP id y3mr2187363oig.11.1610112326237;
 Fri, 08 Jan 2021 05:25:26 -0800 (PST)
MIME-Version: 1.0
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108105241.1757799-9-misono.tomohiro@jp.fujitsu.com>
In-Reply-To: <20210108105241.1757799-9-misono.tomohiro@jp.fujitsu.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 8 Jan 2021 14:25:10 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Gga_5-TX4r7D_4HF6MgiXDqmYn26VV6WQk=b4RyD=2Q@mail.gmail.com>
Message-ID: <CAK8P3a1Gga_5-TX4r7D_4HF6MgiXDqmYn26VV6WQk=b4RyD=2Q@mail.gmail.com>
Subject: Re: [PATCH 08/10] soc: fujitsu: hwb: Add release operation
To: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_082527_991137_1AF1BF53 
X-CRM114-Status: GOOD (  10.86  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210108132510.AeUjtyzbUmXALxRyIIcBHHuOK6XzhK_H1Q2GpKEqTjY@z>

On Fri, Jan 8, 2021 at 11:52 AM Misono Tomohiro
<misono.tomohiro@jp.fujitsu.com> wrote:
>
> Upon release, we cleanup remaining resources/registers if necessary.
> This happens when user does not call IOC_BB_FREE properly and the
> function will do effectively the same operation as IOC_BB_FREE.
>
> Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>

What is the benefit of calling IOC_BB_FREE instead of always relying
on close() to do this? Would it be easier to just not implement IOC_BB_FREE?

      Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
