Return-Path: <SRS0=esR3=FA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B34C63798
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2020 20:57:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62C3221D91
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2020 20:57:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rbANFMT7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VmM2Bo6S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62C3221D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OR5qxLRhd0PqErIp7Emg9AZk1Yd9aqhrXf+sVS1MQ0U=; b=rbANFMT7rkO3uY0U3XPoz+icn
	i3/G4aakaxPALyhkZDxW/iQI8o49wwSpgjb4umWpI4MhCoJJaLJR8laKG6zpRXOIN7t2zA0TeINS3
	RHzMOLnRGuoNxZGN3iVnADuYgNTtDuq6gt1o0bFYnKnBWQY3aWS/Ebe3xYbwa7ZpEo4VnFLSnnZbg
	M+bPXExuij1MjUmG0r7AIGMQm/Nhf0G8YY2J/6vCeOtl03udGd7SSEKSYYM1jb0Ja8s/qTsYZ09Cq
	ziHCz1Vv+r6Xr6bFfx13uvL0H2oAeaVEQWwBHWir3SJgUh47UxfDg5Z9/+BQRAwC9fgEBduopOdFt
	qz1AVPuOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiOIS-0002Yh-FG; Thu, 26 Nov 2020 20:55:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiOIM-0002Wo-UE
 for linux-arm-kernel@lists.infradead.org; Thu, 26 Nov 2020 20:55:15 +0000
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8765F21D91
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 26 Nov 2020 20:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606424107;
 bh=TU2hnTVLI0D2XF4ELV52kz7cc+O4mr44XQxrLdC81tw=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=VmM2Bo6SMoy/OB+AAKk/UPM6UwmjK80s95v86+jylIGjKkshqNus9ACEdVXIoFz1W
 3jG+enfRcxD2nE2jEs1aBQK+/kG5qwNnmwTsM2iTaDMsMN9hgH04rFa70/Zf1F4L3r
 3dMTOVbf+Iz/DHfzA2sNJlvvlbuhiJkLKndlBSP8=
Received: by mail-ot1-f47.google.com with SMTP id z24so2885147oto.6
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 26 Nov 2020 12:55:07 -0800 (PST)
X-Gm-Message-State: AOAM530Df3Nqxiq+STzjhhP5xTSF7cHZga2RkZJAPjxcs5P5rF+1WLWG
 ELVgUADU9gdr+oN4YDpJCjGgq8Mb0OUHjEEyz7A=
X-Google-Smtp-Source: ABdhPJxejRNBcduT13gnFKxzJVkg35SQW/KkD54UlLkoAU2flKw1/NlaYeapb3fHwxFe2jFwMd7UVCiQi7fX3xhFyXU=
X-Received: by 2002:a9d:6317:: with SMTP id q23mr3507660otk.251.1606424106926; 
 Thu, 26 Nov 2020 12:55:06 -0800 (PST)
MIME-Version: 1.0
References: <20201124122412.22386-1-sudeep.holla@arm.com>
In-Reply-To: <20201124122412.22386-1-sudeep.holla@arm.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 26 Nov 2020 21:54:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3xN70zumQ-gwiBxGwoia2bkfGF-c5r=KY3ihhXy4F89g@mail.gmail.com>
Message-ID: <CAK8P3a3xN70zumQ-gwiBxGwoia2bkfGF-c5r=KY3ihhXy4F89g@mail.gmail.com>
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v5.11
To: Sudeep Holla <sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_155515_250390_CC9B6651 
X-CRM114-Status: GOOD (  15.38  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>,
 SoC Team <soc@kernel.org>, ARM SoC Team <arm@kernel.org>,
 Olof Johansson <olof@lixom.net>, ALKML <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201126205450.fIlLy9hgq8zJ203QJXBnAb-RRbrDPOMd2kFC1u8iV98@z>

On Tue, Nov 24, 2020 at 1:24 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> Hi ARM SoC Team,
>
> Please pull ! The tag is based on v5.10-rc2 to avoid conflicts with
> the fixes that got merged in -rc2.

Is there no way to avoid this? I would really prefer not to have to backmerge
rc2 into my existing branch if it's just about the bugfix.

I tried rebasing your branch onto -rc2 and only got a trivial conflict
in one line, and even that could be avoided by merging in your
bugfix branch instead of the whole -rc2.

     Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
