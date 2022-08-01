Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF88C00144
	for <soc@archiver.kernel.org>; Mon,  1 Aug 2022 15:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A23FFC433B5; Mon,  1 Aug 2022 15:29:53 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A72A3C433C1
	for <soc@kernel.org>; Mon,  1 Aug 2022 15:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A72A3C433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-10dc1b16c12so14077284fac.6
        for <soc@kernel.org>; Mon, 01 Aug 2022 08:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=PtgS4dgz8xv7/FHw1JDRxioWwZ+//JkgR/Ho/06ZT1U=;
        b=BzICjI5CjsXpXwfXXBS4lwImefSjPK5kVnk0jR4294uqqPiW8i5QyLCGj/cBSEAcL5
         X81BWaBC0636Q6ZE25zuam/hn4nbLa72QQLo9CxlxH/yh3P+iRNtdinCqRDpDZC/F4L2
         gGSVoEtBMUojJcjcjTeJ5mkTJmOVUwMJqOoU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=PtgS4dgz8xv7/FHw1JDRxioWwZ+//JkgR/Ho/06ZT1U=;
        b=vFRa++dQj3XL1pJB4wPnG/69DcecIqmJHvZJ+k3T31nUjiu4cZpcjcqyRthjpLQ+qp
         7YZlevAUGmY2bzV0E5xWYjB0pMIZ/kYXw0vQNR7j67XByOr3CbdCxo3pTxlnreAr6usf
         fNqsQsvubSk5CW03IITKDxL26EBX/G7Xntz3jsnMg+z/0IV1QRqwYdQipL8FcrHom1+q
         EKKGiHCHAWXVApj2njmCzU3BtUhzlHkdbcIgZ8emo/Ja3gXk0rlUunw7y3UuOxkRqHsl
         ABSXhx/RtwfFmlyS74n+0Jpm4EHSNXfC6BngTTIYpwL29cHDcSD17sagcUxJFWehoX3C
         eZcA==
X-Gm-Message-State: AJIora/Z4DAjt3VLJsvjGR7fuk/YBvn0e4Wnz39vlUcCuY9Pu60biMHG
	iEKDiKxR0cIGxOYZMIhL7IbtwKkYaxftrt3WtGI=
X-Google-Smtp-Source: AGRyM1tzbTAHRTF91s4fSVgabIk4LhgZel5I1s305+Q4+EoJrDRkIAhcf+7XyAOJpR5Sf5tupfBYVw==
X-Received: by 2002:a05:6870:1684:b0:10d:b809:1882 with SMTP id j4-20020a056870168400b0010db8091882mr8102182oae.82.1659367791570;
        Mon, 01 Aug 2022 08:29:51 -0700 (PDT)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com. [209.85.167.176])
        by smtp.gmail.com with ESMTPSA id z9-20020a05687041c900b001048f70e03dsm3172843oac.15.2022.08.01.08.29.51
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 08:29:51 -0700 (PDT)
Received: by mail-oi1-f176.google.com with SMTP id r13so13460235oie.1
        for <soc@kernel.org>; Mon, 01 Aug 2022 08:29:51 -0700 (PDT)
X-Received: by 2002:a05:6808:1c06:b0:33a:9b3b:b3ce with SMTP id
 ch6-20020a0568081c0600b0033a9b3bb3cemr6596099oib.53.1659367790915; Mon, 01
 Aug 2022 08:29:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3GTzeJUdcjVv-1fL7h7e6XRFPA65-5xseQ4=tyZE8UDg@mail.gmail.com>
 <CAK8P3a01piA9bvuUpEPQ6dE4EL4AM8ui4CJGCdnOHPSOBG2Wrw@mail.gmail.com>
In-Reply-To: <CAK8P3a01piA9bvuUpEPQ6dE4EL4AM8ui4CJGCdnOHPSOBG2Wrw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 1 Aug 2022 08:29:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wikSK533pTAw_RDud8sdiNcL7EB62_ueJwYL1X3G=oj=w@mail.gmail.com>
Message-ID: <CAHk-=wikSK533pTAw_RDud8sdiNcL7EB62_ueJwYL1X3G=oj=w@mail.gmail.com>
Subject: Re: [GIT PULL 1/6] ARM: SoC updates for 5.20
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 28, 2022 at 3:30 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm-soc-5.20

That doesn't exist.

I can see the branch ("arm/soc"), but not the tag. I did check your
other requests, and those all had their tags pushed out, so it's just
this one that is missing.

Given the mess-up with 2/6, I'll just skip this series for now - I
hope you can fix it up and resend it tomorrow when you're back h ome.

                   Linus
