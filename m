Return-Path: <SRS0=+ow/=JQ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC9BC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Apr 2021 14:46:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78858611CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Apr 2021 14:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78858611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sIdPm7zO9w/Ei+ojIU+Kxdue9HUQKo6fRUjyGK1maTE=; b=VGhl/po0ndG34faSdwZ+2H7iZ
	uzQlyOjBhIZ/VelxZ9HRm4MvRqkljIIXOPh/wl21DX8je1eW9RHWPqDP8bwmz91m/Egyw7qSkIdwu
	n9PHPAqApMAooNDDTswED2RQ9AdyFbwKJhuZwnCQljNEQQrBzCjz60MUxiRxpgrFHFhlgEq1gntlo
	OWKvHxHtgkrDHkL8XisI/TRCmLxiMloyakePOApSjvS78xZGHcaA3sgXFPkfFcDT6jegGC3VljycL
	9EVDspqXYyuoKVFn06ib+bakLwkWK/iLCxF8DgL9BjVdjXySRayrnB2QQbjJcxR7cf1ivUYKKNs9p
	IDSVxwPIw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYV99-00A8P8-6d; Mon, 19 Apr 2021 14:45:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYV97-00A8Ow-R0
 for linux-arm-kernel@desiato.infradead.org; Mon, 19 Apr 2021 14:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Go+g6qGoGCm83puaR3fvwU8BAsxFNmcapdnDokF14Hw=; b=lju+6alZjG1zgkHzz80bLE4MRm
 ghR5SW0XLq5vqyks9R4Nerms4F7PL4E2mYfofpbILWX4qLhOEcWH5eaAWWdRLOVbB8yxPMbTC+cGD
 OPXAInkM1rnRdHkOGUBV5XKVlK30UoYqN/jYHc/l7rL6joOlMQk5FHpBgOq+Vxd0LLPW2jR334xhd
 3y1dzKIOXY3mDPSgOh3fOW/iX0KgjjiC5oampTQZoRs67esECtreWrAC4NkvzV6bmX4KEmnMwEePc
 GEjRgLVef0dGgAl53E0NJNMXKqIYSjrryZQDrxVpX/fgbOApbeVU17Y1kcCv5qhun07xYmtYjdONE
 OofRIbNQ==;
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYV91-00BShu-SG
 for linux-arm-kernel@lists.infradead.org; Mon, 19 Apr 2021 14:45:04 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MNccf-1lAdP80h6x-00P8Tl for <linux-arm-kernel@lists.infradead.org>; Mon,
 19 Apr 2021 16:44:57 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so20732006wmy.5
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 19 Apr 2021 07:44:55 -0700 (PDT)
X-Gm-Message-State: AOAM530QNX4l9OtApuUR4q9R2lDuAIt5rA26/1cTwZeQMAITYSj5J/yg
 4L00AGXR/4VGkEmBoSQ9GOHItl/3eIr5wRpnJpU=
X-Google-Smtp-Source: ABdhPJw7qcfKMobGVenQr0RkHIs+d3bPN79IEwmrNiIriuBPJAdh6tyhZljPRwl19JD0XPtw75uuw7csDyaRPzvncLs=
X-Received: by 2002:a7b:cb42:: with SMTP id v2mr21646797wmj.120.1618843495594; 
 Mon, 19 Apr 2021 07:44:55 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8Xeet50bqWAY0jG_GRkgvKvFn94XtGDaq1gaVYVkyV_JUQ@mail.gmail.com>
In-Reply-To: <CACPK8Xeet50bqWAY0jG_GRkgvKvFn94XtGDaq1gaVYVkyV_JUQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 19 Apr 2021 16:44:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1rG6qKjVvr86G=6cgkhReQUbsvQAkdxg7A2HsJ7n499A@mail.gmail.com>
Message-ID: <CAK8P3a1rG6qKjVvr86G=6cgkhReQUbsvQAkdxg7A2HsJ7n499A@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: bmc: devicetree changes for 5.13, v2
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrew Jeffery <andrew@aj.id.au>
X-Provags-ID: V03:K1:pvdmDYUW7FBrPmoCoyaCjA7qzim4Bn4544XQcL/d4+ogRoL4sxG
 WK+GKyMCYylHBWv4kfWgWegKrXQeoshROEAK6OEMpGUFU17ulDwkQPyEbr0jogqA3i9om/k
 yMUOmxX6SHR9sLbx2EjvQiPI+xvX66h4vgx0J1ktbMqoyvzFdhWlxUQxFHSczxa0Q7gVeDJ
 ZUvm6UIA75wQAta46mb3w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BVzinHU3qNI=:8tTqqSPtzg0BYeo5ladpxm
 GJdFmeAhtudadfESm4tq1N8TkeaC9Rhjiv4tyrgoFWFy2yyWR+DaBgw88nvA/zLfZ7768KvlH
 k6NFhNq1euWhJRgej3jXXPoQ0GPsv8JIZPgXlW7/SE18+GtZu7BCJHuW4R8K9G1I0JJ7++2Vc
 1atKYbGwkwjkREYzc/cvTFRv0jDSEGCX6WcnBvHZODP9dSy3LLdPl9NKuk7UuJuAvlex+8TDc
 tuY6ugeaWwuBJb782pFWqFU786wdH0hLz6bE2TIJjoXROFoIGunr3+cVHiv2lfZ2C8jV4GlgO
 jLw45RfZgYM+V/Jtc/8tq1zcf7D56odLjLsvE4q7oDcVFlNpJreFBokdjdLXI3i2OS21Z9zaK
 Asb7vmZWMBz8Pah6kOfRE6tnayN1qsvxnQ0toZ3sMM3Z83Vw/YnM6hJQFz9458P6TFgCDBpX9
 6xzQtCgflCjimq+x2P5puyh+KlABO1fPrTwJLnbKNCayZC+Tk99B3ZS9eXM/LAqjk2IZ69Uda
 kcbCR+gLU4jZ3GAXDuo6aqnXXd26pQpfjQnT/hxgvbShNXl1dA1IkUnjWMFyn9huUrav8BOgX
 TMbvX9Buse1wNfNTSSi3GZquUDbT5jn7KsRJY7yteyXUvdRRkLU2TcEwG8qfrixM3Z6bwpMEB
 E5nU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_074500_225435_5BABE392 
X-CRM114-Status: GOOD (  16.85  )
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
Message-ID: <20210419144439.bo20DuJKvFbHfbqFlZw5dghWxyq8mWIeZuy9FYBxbFw@z>

On Fri, Apr 16, 2021 at 5:27 AM Joel Stanley <joel@jms.id.au> wrote:
>
> Hello Soc maintainers,
>
> Here are some fixes for the changes that have already been merged for v5.13.
>
> I also merged some changes that came in later. If you would prefer to
> not take them then I can send a pull with just the fixes.
>
> The following changes since commit f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:
>
> for you to fetch changes up to f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:

Hi Joel,

something about this pull request doesn't add up, and 'b4' refuses
to pull it since the 'since commit f0145db2' and 'up to f0145db2'
references refer to the same commit.

I assume this is just a copy-paste error on your end, but it would
be nice if you could double-check and resend the pull request
based on the ee33e2fb3d70 commit that I merged.

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
