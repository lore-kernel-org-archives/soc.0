Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C98DC433F5
	for <soc@archiver.kernel.org>; Thu, 24 Mar 2022 01:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 62945C340E8; Thu, 24 Mar 2022 01:41:48 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B5C61C340EE
	for <soc@kernel.org>; Thu, 24 Mar 2022 01:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B5C61C340EE
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f53.google.com with SMTP id m3so5592987lfj.11
        for <soc@kernel.org>; Wed, 23 Mar 2022 18:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4VmCNpUktJfhcqAvDV0WxH3zaT4vDImvmvOoWvKF5Gs=;
        b=UW43zwyr7VzAWy0J7pa4I6DoGCPEoRpfqb5FRW/fgJtPoxaaWAvDDDKni4bVmn2CF7
         FoneE+ygtfrCccxNCf0tihRpQDykhG7fSiKsrY9JTHmw2Y8gDqaIcBn8lATXk5HEBP5w
         6YLjgN/7mQ4ZVp+a/2pjFriUi925WrG0ZXVCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4VmCNpUktJfhcqAvDV0WxH3zaT4vDImvmvOoWvKF5Gs=;
        b=e1WYNMPibHOxUxC6hffwtNCBqlk4TIsLqsjOemRSipfY5FLRu2K6ikvLYFRjPR9WK7
         105gbXZO2FHzDo3YhAV+7hCcWUtPUKIDHrCUcQTxKIKJ9wbS6HZahf4SCUKU4MzvJq9S
         KXt0FcL/ZOLebqvVmY3KHaSIHuiPJGQlL2KUfbKtKqdHi7lgITE+mWc5fsBUM1L26oc0
         GKOGmp2oc5jZj3hCBZhqyYj6mFOI/uh753ICcY2CDGiJQSoK/cIooFyYI1dsr3H/LeNS
         kfYu3Y24rPdgeaxtryhmrZJVLgaMeaEHAoKCqOFD8CppYMIEpYIsoDER1yR6xuErBZqt
         kAnA==
X-Gm-Message-State: AOAM531reB6URGHyposb2HOHjj57hPtM45X/APblxpSXDbnZXoKTbFiw
	Ng29ylyTnl+KBXgkrtlhQure4AG8kE90LnMFkZg=
X-Google-Smtp-Source: ABdhPJyCDliFqaYYQbwkCTZ085z+z+VnF/ZBW2dPbyPZxfQYiSZO0yAYUP5p8Q/VaapkXownCL4fqg==
X-Received: by 2002:a05:6512:2395:b0:44a:33d2:b9b5 with SMTP id c21-20020a056512239500b0044a33d2b9b5mr2067709lfv.514.1648086104451;
        Wed, 23 Mar 2022 18:41:44 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id k10-20020a2eb74a000000b0024965dbf2d8sm159875ljo.82.2022.03.23.18.41.43
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Mar 2022 18:41:43 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id q14so4238709ljc.12
        for <soc@kernel.org>; Wed, 23 Mar 2022 18:41:43 -0700 (PDT)
X-Received: by 2002:a2e:9904:0:b0:247:ec95:fdee with SMTP id
 v4-20020a2e9904000000b00247ec95fdeemr2372025lji.291.1648086103115; Wed, 23
 Mar 2022 18:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a29JCfCNWrJ-x7S+kewcSBpeguyo8fmUTt_V4gfrW3=HA@mail.gmail.com>
 <CAK8P3a182FVbZ5QfVhMr20nxQN31fK29Csr_GRp_WpFoBFEPzQ@mail.gmail.com> <CAK8P3a1oGWkyPHZ-gV3pP94hOrJJFBsvvkuzzXBhaYpbzEGR5w@mail.gmail.com>
In-Reply-To: <CAK8P3a1oGWkyPHZ-gV3pP94hOrJJFBsvvkuzzXBhaYpbzEGR5w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Mar 2022 18:41:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=whLyCDkXfMoAYFWX4qbLg7KajXiQWLNhfcaN5EB3HuO5w@mail.gmail.com>
Message-ID: <CAHk-=whLyCDkXfMoAYFWX4qbLg7KajXiQWLNhfcaN5EB3HuO5w@mail.gmail.com>
Subject: Re: [GIT PULL 4/4] ARM: DT updates for 5.18
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 23, 2022 at 4:12 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> The new machines are really too many to list, but I'll do it anyway:

Heh.

                   Linus
