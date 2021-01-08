Return-Path: <SRS0=l7M8=GL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 384F1C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 13:29:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBCC322E02
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 13:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBCC322E02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PPwU22Cm1AMMbD2S2TbAmYBC7U+TjYfuB8b9XIrsOjI=; b=poKacSaoMDVFwDtbnjJgE54i/
	Z1LA115gzsDzxE8miashU7O3oAAIYjdGdNH3EYNIg3ZvzTBakgqEyVyDRwFruOixNWLqsZ6XQtcaG
	qEUewkjKW5Mb4VqJ7Z6T8qcY850yVheZjly2Ue09eIlBslAbpGrgtitR9p/a7r27ruAGX4aXa6u4M
	Zd1zJ5CPwJZuoaVTfGmq2FmSbe84iFIkeoOMMkqAA1UvzTVegovBe0a+8O03ml47BUythioFianJY
	2AqDJjb8CTVqlRs8tTQvJyBUG47MwqdV6o2h6UWAttLyk+AJUpEgL0imC5o82AnLkhfqtrJz03SIW
	wXHUMJVQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxroN-0008JW-KD; Fri, 08 Jan 2021 13:28:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxrnz-0008Ix-MQ
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Jan 2021 13:27:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C04852396F
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 13:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610112470;
 bh=nt6ziUzHkm3hfrCQXU1yzp/8m62e8IE7ZOVrqdMhV9Y=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=o8BBVlEkk/2DOJqPrlhzkqXZDSFqZkIHtaZVaSWJBtjJYBm3aZHSnc2KDZOMB0Cso
 IIOqtKc5XT9Gk29lj+idvFh5nOdwceLvPiOwEswduR8kanWQx8cwlB9nG2nA+MOTQJ
 XxIGLD8KXiCYgpzJvGGBvqWLkUATQPCfM2zqK5LUXYVonb+lQAML0tJQTCYASBf9km
 k9C5pWfblV2/0ki0QNrCd6tstEIdtZMMHHPUIN4+Lb1bOgGJwYtM5V+C+NegCwD0zT
 wUztvyMBFKOd4Gv8UEu2UP3vwTGan5rCFRHuskuedmM+3JBqPy5nb5lh9qnXimmwiY
 zs6sL+pC0ogrg==
Received: by mail-oi1-f182.google.com with SMTP id q25so11282493oij.10
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 08 Jan 2021 05:27:50 -0800 (PST)
X-Gm-Message-State: AOAM531vDgnms9A04kcv6o47ROAhMSnXEguroWqEF4Aj4GW9K/MfFYHu
 lrTP8enmUZvfqFBsIi+z9l+jOVlyHDfks+lQqRc=
X-Google-Smtp-Source: ABdhPJxzS4h2MK5B78Iv8vYCQh0roQTlfXNRTBFIfep0yXLkz/Fy/e07HKL+4g3po6EkgtmvS53fH+uipK43dKV2JYk=
X-Received: by 2002:aca:fd91:: with SMTP id b139mr2185199oii.67.1610112470141; 
 Fri, 08 Jan 2021 05:27:50 -0800 (PST)
MIME-Version: 1.0
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108105241.1757799-10-misono.tomohiro@jp.fujitsu.com>
In-Reply-To: <20210108105241.1757799-10-misono.tomohiro@jp.fujitsu.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 8 Jan 2021 14:27:34 +0100
X-Gmail-Original-Message-ID: <CAK8P3a22Cc4J6pr7h357p70k2eJ2dNxkHLWYC-2bMh7A1+ZhTA@mail.gmail.com>
Message-ID: <CAK8P3a22Cc4J6pr7h357p70k2eJ2dNxkHLWYC-2bMh7A1+ZhTA@mail.gmail.com>
Subject: Re: [PATCH 09/10] soc: fujitsu: hwb: Add sysfs entry
To: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_082751_811341_33D4D831 
X-CRM114-Status: GOOD (  12.49  )
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
Message-ID: <20210108132734.DKDbfphePu3xWiDfNGR_VX2mVg1__tC9KZYsG2cPn2E@z>

On Fri, Jan 8, 2021 at 11:52 AM Misono Tomohiro
<misono.tomohiro@jp.fujitsu.com> wrote:
>
> This adds sysfs entry per CMG to show running barrier driver status
> for debugging user application. The following entries will be created:
>
> /sys/class/misc/fujitsu_hwb
>  |- hwinfo ... number of CMG/BB/BW/pe_per_cmg on running system
>  |- CMG0
>      |- core_map      ... cpuid belonging to this CMG
>      |- used_bb_bmap  ... bitmap of currently allocated BB
>      |- used_bw_bmap  ... bitmap of currently allocated BW
>      |- init_sync_bb0 ... current value of INIT_SYNC register 0
>      |- init_sync_bb1 ... current value of INIT_SYNC register 1
>      ...
>  |- CMG1
>   ...

If this is meant as a stable interface, it should be documented in
Documentation/ABI/

However, if it's purely for debugging and may not get maintained
forever, you might want to use debugfs instead.

      Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
