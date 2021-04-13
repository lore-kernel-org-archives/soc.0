Return-Path: <SRS0=OvlU=JK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B0BC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Apr 2021 09:20:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13B30610CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Apr 2021 09:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13B30610CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TKuT2IMZ9L3rvAF+JHQ5DgNJ0ymzLZItOOcESpRM6EU=; b=a1xzzOwqRHaE/1ZlRWHO4GnOt
	YsbRCOJ87BjMNHadk9uH/fqD7SK+Qtc9t2Ck5ZeTmRg5I3nfHVuFo4C9Vjyx5oJ9axqNXXGNrfXdH
	jG1JmXJY7qqNECD7YhiGL/oFGVM2i1ostTqHMrY7FfX5hFvuUPSXJSQFgRUpHPKs5tdOcgmMFa8yO
	5iqhruwxJ2s6rV3oDZ1x0XCQh6JBhYC1zq+1zlIzl+fomp0pNeDfFNGv5jfk6w53JdL5b1vL2Fv4x
	sakijc6Bz/urvBe9TVhhLYG+X7jNVmLHVpaAv453CinKRmjK3kK84/gGx4QgUI4xHxlDTDHbzsxu2
	wabXrrZJA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWFBK-008gLU-Jz; Tue, 13 Apr 2021 09:18:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWFBB-008gKp-17
 for linux-arm-kernel@desiato.infradead.org; Tue, 13 Apr 2021 09:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=QEZTnIYvaD/fc/Rxkrg/NqbXN0wVY3t3X1L8DETpo0E=; b=F/8NmYlOTSOTMPfTemTIBPD3UM
 IzCdHgOEr+Sp/pQYMJf4GjbqIo7F41hbgsaB+aYwd+vVNwzAYWd3U7r5l1sDpFZEhBqIkwm0dgMVs
 Jl+SY0BOCofbU7St7PS44pTeL4skyZ7S8iE5dWBjP0IDtWzkYNRZP/AbuVjjUsp4ZuMlT1n3RShZK
 zMGh1PqCUrbc/2i97rRmsJGglToOgPORt6i8ZigVTKJCTnUTtwjXVuQWAhQyJ5iMmA2ZPy1kmsQy9
 vIn2Wyamn3hx6B1qinw7xf5YB0kvtNK6Bpa/pRYRWaoEcl/wMNbOp9HKngrTt+0JQgiMbyC/1WwKD
 6Q6D+C0w==;
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWFB8-006s41-39
 for linux-arm-kernel@lists.infradead.org; Tue, 13 Apr 2021 09:17:51 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MILru-1lHvp91bVc-00EIZE for <linux-arm-kernel@lists.infradead.org>; Tue,
 13 Apr 2021 11:17:47 +0200
Received: by mail-wm1-f47.google.com with SMTP id p19so8325339wmq.1
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 13 Apr 2021 02:17:47 -0700 (PDT)
X-Gm-Message-State: AOAM530l1DhQi6MQ/i6Byf3qCjUFJYxIBnBOJeB2uTk1KIsfuADz0B0J
 YU2zNek7iaMZ+MbAf9RZ68+bSfS1B6DcCvjfPWo=
X-Google-Smtp-Source: ABdhPJyNUve97JrIr0kBguXGbkRBZOX5rXMwISaSJVKj21G113V96C52lgPivPrrcKwvuuf/k9OPjKrBiJ9y9vG+wN8=
X-Received: by 2002:a7b:c14a:: with SMTP id z10mr3046097wmi.75.1618305466986; 
 Tue, 13 Apr 2021 02:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210412134700.1977619-1-linus.walleij@linaro.org>
In-Reply-To: <20210412134700.1977619-1-linus.walleij@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 13 Apr 2021 11:17:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1yKNF9NkRZNKtySjFKZ2WzLKrk0B+XkcmH3A=awi6C7g@mail.gmail.com>
Message-ID: <CAK8P3a1yKNF9NkRZNKtySjFKZ2WzLKrk0B+XkcmH3A=awi6C7g@mail.gmail.com>
Subject: Re: [PATCH] ARM: defconfig: gemini: Update defconfig
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-Provags-ID: V03:K1:9FfwZ+mdZyhKnubYgoKkYwsH5N/lcxyZK5zbataSjrpomwfPzZl
 Mu6YeJMyd/3YXSmxwuUiG+U7F9iZ6gxHDcMAgcNF4b1it3MSbS9B0xkhcWo5Mpk8FUTwwnN
 rxkJtZN0lYGgLfxDFTYRLpW48Dp4MovLeaL89kKL9ZN3cgd4qQddyqqUeuC1XXsClHsJfyf
 aaor0gYpRpsbFR+RUhsNw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3O2I/69cHmk=:KcNf1pWV7QPf9D4ok0weto
 6tVZfVIxauYsZrU3bgXTUSEBpdowBfFTfr2KLCNPfHHWV6Z8AVI6uhS5nWcVNfo7ogAY1sQUd
 HKIinYH2IEDA0NKiJ42WJW2oVg/PHFJrsm4ePTejQhe/h+/g65cRwB4atMlw9Nhe3gUQ96uad
 Hn70uknRgfMA9fTuW27Su9nwqYUmW+qQrsNDastI4b/3tJI0YDIwjmn5QLN7gnnwZKeAqvRZM
 /ooq6KSe2KzEG85xlOimm0kTeS22LSkt8p+5I+s/WKNSCsa8n3J0loyNX24Eyqn4qx81gFWzK
 DrrFK/VRMuQ/J/hCjqKXS67iul86GHPMSCwk5ufvyaMizfXtD8RnqCIuz7WUi2FUpfL/J1Sf0
 eQGftjzfXkANB8bFN5WiG3mqfyhVSzyrShri2U4sZQVfvlMUGxLf/xdkmz17WaYKhfo+XQ18b
 JK4pkrc3sD7wA1qoUHEpEXtKkX0OjNcEHlGVUTirZx/LlztuLG2KRv+gmCI/usZhoUX5rigfb
 08AKM7KhL8tvObxbBJpj7U=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_021750_446145_BFE884AB 
X-CRM114-Status: GOOD (  13.89  )
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
Message-ID: <20210413091731.uYwHeqs8v_gWjSxKDH_zvLEWfUt_WNEycEyC1hN26yA@z>

On Mon, Apr 12, 2021 at 3:47 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Update the Gemini defconfig: some moved options, added som
> WLAN drivers existing on the supported platforms and enabled
> the drivetemp sensor which is used on the NAS devices.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

I don't like patches that mix functional changes with what comes down
to whitespace. Can you resend this one as a series?

At the minimum, make one patch that adds BFQ, DRIVETEMP
and WLAN changes and another one that moves options
around that change after 'savedefconfig'.

For the CONFIG_ENABLE_MUST_CHECK removal, can you
send a patch that removes this line from all defconfig files at once?

      Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
