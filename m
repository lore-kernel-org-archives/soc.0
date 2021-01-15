Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DB2C433DB
	for <soc@archiver.kernel.org>; Fri, 15 Jan 2021 17:07:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8A69C2396D; Fri, 15 Jan 2021 17:07:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60F14222B3
	for <soc@kernel.org>; Fri, 15 Jan 2021 17:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610730456;
	bh=YGd33e7cZIPZF6DstNEUxtZMH/nm/G8oa6S58W9tI48=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=FPnuv2fY/3qW6vo+Efuf3a2q/osrtKX89hB6wxzfAKdwLsh/eF1/dfWD1CjQLUsym
	 X2R92SHuwJTMePHxAIvhROIiQlwIiG4w9nHte3iqKc06gtWhIftl/edpYzLPiahMDP
	 dRWNsb4W5zayr5xiN+/JuinbhcJnVzywrY8kURuFwwiPbg7XTQTp1+D1K0pVc22FoT
	 5DLeJwbL0WQI3BG3JO8A7VPhUE638SngjtbGIF+m6t1nmykiob0GAuIUryMPEhMIqB
	 Bo+e51XcFRwmbqO4CEWlCjKx0NYa/b2HtLVPtX5bH87TERls6fsRmHU0Sr0ZgP1vZ1
	 F5nHgYfuXP0nA==
Received: by mail-ot1-f51.google.com with SMTP id b24so9214372otj.0
        for <soc@kernel.org>; Fri, 15 Jan 2021 09:07:36 -0800 (PST)
X-Gm-Message-State: AOAM533juUbzDr25q1nu+DvApd0bELOmuEZZYRx9n8zq3xX7Z/vL9c1C
	SUS9m/fnBm/a75VywbusrL2S+oblDFy33WpE+uU=
X-Google-Smtp-Source: ABdhPJyt5en3jyLXamufOnOIpe6JRbUfAFTRy2hRclm5robQJ5u/ttpnh0hYxExTSIeqywtril8uKByrr9ZjK+UsjR0=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr9003016otm.305.1610730455799;
 Fri, 15 Jan 2021 09:07:35 -0800 (PST)
MIME-Version: 1.0
References: <20201214043922.p7njpxzrcwfoaphe@toshiba.co.jp>
In-Reply-To: <20201214043922.p7njpxzrcwfoaphe@toshiba.co.jp>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 15 Jan 2021 18:07:19 +0100
X-Gmail-Original-Message-ID: <CAK8P3a27RkYuw8GMHWpGUbqfHjeraQCNJc7B1m_hXd4_Zgsspg@mail.gmail.com>
Message-ID: <CAK8P3a27RkYuw8GMHWpGUbqfHjeraQCNJc7B1m_hXd4_Zgsspg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: Visconti: device tree changes for 5.11
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, yuji2.ishikawa@toshiba.co.jp
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 14, 2020 at 5:39 AM Nobuhiro Iwamatsu
<nobuhiro1.iwamatsu@toshiba.co.jp> wrote:
>
> Hi, SoC team,
>
> This request includes the WDT / DT patch for the Visconti SoC.
> Please pull for v5.11 kernel cycle.

I'm sorry this came too late before the merge window and did not make
it into v5.11.
Can you please rebase on top of v5.11-rc1 and resend the pull request?

Thanks,

      Arnd
