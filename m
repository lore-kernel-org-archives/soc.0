Return-Path: <SRS0=waa1=OR=zonque.org=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4915C433F5
	for <soc@archiver.kernel.org>; Mon, 27 Sep 2021 15:01:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A92BE60EE2; Mon, 27 Sep 2021 15:01:21 +0000 (UTC)
X-Greylist: delayed 367 seconds by postgrey-1.37 at mail.kernel.org; Mon, 27 Sep 2021 15:01:21 UTC
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 523BB60F4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zonque.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=zonque.org
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by mail.kernel.org (Postfix) with ESMTP id 523BB60F4A;
	Mon, 27 Sep 2021 15:01:21 +0000 (UTC)
Received: from [192.168.178.130] (p57bc9b61.dip0.t-ipconnect.de [87.188.155.97])
	by mail.bugwerft.de (Postfix) with ESMTPSA id A78D13AF4C9;
	Mon, 27 Sep 2021 14:55:13 +0000 (UTC)
Subject: Re: [PATCH] [RESEND] ARM: sharpsl_param: work around
 -Wstringop-overread warning
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Russell King
 <linux@armlinux.org.uk>, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210927145332.2784005-1-arnd@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <413f2684-f818-4d0b-bf7c-142f55b3737f@zonque.org>
Date: Mon, 27 Sep 2021 16:55:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210927145332.2784005-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Message-ID: <20210927145513.UZ5Sphm84j_FpHV0LQX9kd_HlkuTNmXKK2dAcul8qIE@z>

On 9/27/21 4:53 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc warns that accessing a pointer based on a numeric constant may
> be an offset into a NULL pointer, and would therefore has zero
> accessible bytes:
> 
> arch/arm/common/sharpsl_param.c: In function ‘sharpsl_save_param’:
> arch/arm/common/sharpsl_param.c:43:9: error: ‘memcpy’ reading 64 bytes from a region of size 0 [-Werror=stringop-overread]
>    43 |         memcpy(&sharpsl_param, param_start(PARAM_BASE), sizeof(struct sharpsl_param_info));
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> In this particular case, the warning is bogus since this is the actual
> pointer, not an offset on a NULL pointer. Add a local variable to shut
> up the warning and hope it doesn't come back.
> 
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578

Acked-by: Daniel Mack <daniel@zonque.org>


> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> If there are no objections, I'd apply this one through the soc tree.
> ---
>  arch/arm/common/sharpsl_param.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/common/sharpsl_param.c b/arch/arm/common/sharpsl_param.c
> index efeb5724d9e9..6237ede2f0c7 100644
> --- a/arch/arm/common/sharpsl_param.c
> +++ b/arch/arm/common/sharpsl_param.c
> @@ -40,7 +40,9 @@ EXPORT_SYMBOL(sharpsl_param);
>  
>  void sharpsl_save_param(void)
>  {
> -	memcpy(&sharpsl_param, param_start(PARAM_BASE), sizeof(struct sharpsl_param_info));
> +	struct sharpsl_param_info *params = param_start(PARAM_BASE);
> +
> +	memcpy(&sharpsl_param, params, sizeof(*params));
>  
>  	if (sharpsl_param.comadj_keyword != COMADJ_MAGIC)
>  		sharpsl_param.comadj=-1;
> 

