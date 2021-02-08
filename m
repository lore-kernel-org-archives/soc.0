Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 483FCC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 23:24:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0B1264E31
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 23:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0B1264E31
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pK8kqaKbxT7TBLrDq6zowBtFGejRrMjd9DBGynRCGN4=; b=khaMLmY9BSgCWrKo3Htb1myYc
	xTZyId3c5nZP09pw+6CFptdhj6ASnKSFkrYhjU9W4WJW894qOLmMSIzg7erHVdeAhEiKAv0cTmd8R
	YXK9O8982D1LaBZiYEHBnaXs8OuJc8pCOu4eQNeLKb6ivCfR1aX9qQ2CvN/vTnwM+Q+uqFXcMF4aR
	z/ap3tPIA5FdeuoQU/FGmFqpg15wq+aDISEkH0yu3JKlmBWmx1rlauoPtYNJqA/VeqNNmz7JJkZAK
	tJOqTkiLYiwazu5LkwIkkvUESSkS15YeQZjrlZFL9sKYWJkbsKXHCc+gnkn7nFPMWE5jSao0pFtJQ
	gBgx00l0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Fsq-0002hy-AG; Mon, 08 Feb 2021 23:23:56 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Fso-0002hS-6J
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 23:23:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 66B1B4207F;
 Mon,  8 Feb 2021 23:23:50 +0000 (UTC)
Subject: Re: [PATCH 05/18] tty: serial: samsung_tty: add support for Apple
 UARTs
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-6-marcan@marcan.st>
 <20210208105451.yumjjunjeyrglfnw@kozik-lap>
 <11d36c47-45c6-03ee-2d08-6692b5d0e241@marcan.st>
 <20210208183721.4gc7vyfgtpk7nch3@kozik-lap>
From: Hector Martin <marcan@marcan.st>
Message-ID: <d9ab5faa-5c04-00a2-a560-ff01f14afcc6@marcan.st>
Date: Tue, 9 Feb 2021 08:23:48 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210208183721.4gc7vyfgtpk7nch3@kozik-lap>
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_182354_376534_EBF95E30 
X-CRM114-Status: GOOD (  15.90  )
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
Cc: Arnd Bergmann <arnd@kernel.org>, devicetree@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, soc@kernel.org,
 robh+dt@kernel.org, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208232348.D-c3rGC0UsDVK5DexcUzgjH9OyJ7mvRITpeqi0GHO4g@z>

On 09/02/2021 03.37, Krzysztof Kozlowski wrote:
> Looking at Greg's comment, we can get rid of the PORT_ stuff entirely.
> First of all, PORT_S3C2410 == PORT_S3C2412, so this define is not
> accurate.
> 
> This leaves us with three types (s3c2400, s3c2440, s3c6410 and Apple).
> The s3c2440 could be removed with adding a new "ucon_mask" field to
> s3c24xx_serial_drv_data.
> 
> This would end with s3c24xx, s3c6410 and Apple - quite nice choice.

Works for me :)

> You're right. This one would have to be improved before your change.
> Instead of replacing specific op calls in startup, I think it's better
> to have entirely separate ops instance for each variant:
> 
> static const struct uart_ops s3c24xx_serial_ops;
> static const struct uart_ops s3c64xx_serial_ops;
> static const struct uart_ops s5l_serial_ops;
> 
> This allows to add a "const", since uart_port takes such const pointer.
> 
> Still during s3c24xx_serial_probe() correct ops would have to be
> assigned, but at least all ops are easily visible.

Roger, will do this for v2.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
