Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F268C64ED8
	for <soc@archiver.kernel.org>; Fri, 24 Feb 2023 09:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DFA2CC4339C; Fri, 24 Feb 2023 09:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF89DC433EF;
	Fri, 24 Feb 2023 09:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677230738;
	bh=0cznCf4uVK5xbRGk25h2B+QO0J5PcIgKhpvTTZGVyM0=;
	h=Date:Subject:To:List-Id:Cc:References:From:In-Reply-To:From;
	b=iO2XI9Bt9SHAjxRU6FZ4lbPfhYW1D0aH8g8S/GnRDP9yW9L4I+Qs1hB4jGiDtrhlB
	 ClLch2VTMXz3VvFMtH/Im7Pf/U28qRaz8XzKc6TQu9T0MlH9n/KQ1XTqdNy8d/i9dK
	 Hpvtq9Rs0dhmAsL1jnT3abiDhoAqvj6fPhUYCbxaCgcDvAIBWZH73FPLi13Uxr/ANI
	 ahtYoGJFVFKymmkN556ahss33SUfgwCtWDX9FS23yntJ2pCfO+PJMmnyvQYfOVELYM
	 rgiQwd/zJOilOGyzqgsp2+ddoYaxpw5MsAoouqiSkGHv5dp5E57TJR1xq4dUsklOma
	 mgQ3ly5u9lJaQ==
Message-ID: <9b57bf80-6a3e-a96d-56e7-f93ab5840525@kernel.org>
Date: Fri, 24 Feb 2023 10:25:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RESEND 5/8] leds: Add support for Turris 1.x LEDs
Content-Language: en-US
To: Lee Jones <lee@kernel.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?=
 <pali@kernel.org>, pavel@ucw.cz
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
 soc@kernel.org, linux-kernel@vger.kernel.org
References: <20221226123630.6515-1-pali@kernel.org>
 <20221226123630.6515-6-pali@kernel.org> <Y9Ozg2O41a2iijMc@google.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <Y9Ozg2O41a2iijMc@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/01/2023 12:20, Lee Jones wrote:
> Pavel, are you happy with the user-space interface?
> 

Although not about user-space but about code - entire review was ignored
by Pali and not implemented:
https://lore.kernel.org/all/CAHp75Vcr6o2rm+T6Tr8sS4VXCLVHtmLPWy-njOKAvO4AcZoW=A@mail.gmail.com/

Best regards,
Krzysztof

