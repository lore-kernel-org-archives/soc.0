Return-Path: <SRS0=3r8u=P4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BAA5C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Nov 2021 03:01:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D575961107
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Nov 2021 03:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D575961107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/MrUIn9Q6Z9UVKFDKUSKNJU8LWdCD9jDWEA9lk1R2Bw=; b=z9xk0Z9YA4BJ1f
	jYzCYdruukk/o7woCll3+EXbBMFmWTAywHCMAaUG2QiWiPMbwjbbc9sAZEvPYM7St0G2vHtW6//oX
	8neAR5iYpKP8OHJi7nPIxVvYvdtH0ImJiav5dI5wKQ/VdcKwZQq+OvTxUSBvryJh9G9F8Iw005l08
	eTAToaKgLfOfvOjNFcxk72Lzj4wlifq2Rbbf0ERobRj0Sww0pVJPw0n8ymIoovaDbrm+1VrItEDYd
	VFzHqbAWXT8n+/zRsJ8Az3pRIO0nfyYO6ABQwdHy7vfqhYmQuU1bZXMFHpPS9ufhWeaHLAHFstzTT
	Ds5p9QlzAGycG8A/jiyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkHLu-000Zhq-OU; Tue, 09 Nov 2021 02:59:14 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkHLr-000ZhH-DJ
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Nov 2021 02:59:12 +0000
Received: by mail-qt1-x834.google.com with SMTP id x10so15352907qta.6
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 08 Nov 2021 18:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KTb+7uV/W+NPaaM9VZAqKHX3rqV7nBXAeF1f2Hw+bI4=;
 b=ij+A9vEaG/2b35tGtQspRFkQMmic+mzirQ6ss4f/MwfoH4dzDnv59zb8J+Z+6X+kh7
 4yjzK5yktnBWaipNbGhofbMEcLokPg7SctncpMsolsWZCuvWq7gJSy7Gai6sWstsXsrb
 CMf6vZW/0s4TevvgP7k2kMqwgi89Tcvt0JJJVRhUtQUSKEbx4eO1+RaNnHexPy6SE4F8
 wCVdqB0/ghtqKkXCYW4O7akYJrWwXwCCzvIW8M4H3/qOhLvf4PJmRjuIgDD5YfkSCr5y
 4rP3pBXOd0s5VfWM3hWx75mee76G+majcCOiD/sB3Tw/sUYZt3TVVz/bhAQAMicr6/ta
 WsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KTb+7uV/W+NPaaM9VZAqKHX3rqV7nBXAeF1f2Hw+bI4=;
 b=xm0Got0nIFaCLWOKFkNQtGJT3OQkXPVLZlyM9VYceZ6JgRaQUArW+shp2EIW127z+q
 J7QZM6i/EePwYAC+G4L8TDMIQCZz0ElvKc/OzNE6MF3gLxPyFpWwwOPl7Xs6dI+qeNSd
 KqWeIYfEv9VwTWaByh4yazqEZ+MVcBZt8FtUfZ21aU00ktK5oUWqVhjHG7gtZ2kedR6z
 D0im5E0mCogVh7XbOrwSdie4aEbLAbAn9UpIGR6ta6cai2eUg8iGujD2B5IRFqSVt6Fx
 Co3RiVq4EP1JKRSwxiq7CuUfRIQomlcWz+KhhE0aqMg47vUN0mn1CaxDf0gB8hJU+ZUQ
 Ia9Q==
X-Gm-Message-State: AOAM531BIkqJIkXAlp08TE+S1aZHB5gzOT5MP/eQHtGLyrTIaHfl4DQb
 vBZodSUL+rvn7/QZYrNzYUk=
X-Google-Smtp-Source: ABdhPJwFKM3gy/6Cpe0SzF+P+k3n+KU7EeM7tmAMCtcmrYQX7XtMBHopzbqmIn4FtK1sLFxDRdNQ6g==
X-Received: by 2002:a05:622a:2d6:: with SMTP id
 a22mr4824094qtx.220.1636426749863; 
 Mon, 08 Nov 2021 18:59:09 -0800 (PST)
Received: from [10.4.10.38]
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188])
 by smtp.gmail.com with ESMTPSA id g13sm11137437qko.103.2021.11.08.18.59.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 18:59:09 -0800 (PST)
Message-ID: <7a96b7aa-b7f7-ac9d-89e9-4843104f4254@gmail.com>
Date: Mon, 8 Nov 2021 21:59:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 02/13] dt-bindings: pinctrl: add i.MXRT1050 pinctrl
 binding doc
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh@kernel.org>, mturquette@baylibre.com,
 aisheng.dong@nxp.com, linux@armlinux.org.uk, s.hauer@pengutronix.de,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 adrian.hunter@intel.com, linux-mmc@vger.kernel.org, kernel@pengutronix.de,
 shawnguo@kernel.org, linux-serial@vger.kernel.org, jirislaby@kernel.org,
 robh+dt@kernel.org, abel.vesa@nxp.com, festevam@gmail.com,
 ulf.hansson@linaro.org, linux-kernel@vger.kernel.org, stefan@agner.ch,
 olof@lixom.net, sboyd@kernel.org, nobuhiro1.iwamatsu@toshiba.co.jp,
 linux-clk@vger.kernel.org, arnd@arndb.de, devicetree@vger.kernel.org,
 linux-imx@nxp.com, soc@kernel.org, gregkh@linuxfoundation.org,
 giulio.benetti@benettiengineering.com
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-3-Mr.Bossman075@gmail.com>
 <1635902437.626178.3880384.nullmailer@robh.at.kernel.org>
 <c97c45ac-d9d6-a21b-9c43-69f58b07f265@gmail.com>
 <CACRpkda9e8FtjR3XB97Lu8X5=yeApk==4+zSqo3Qp6bWxgJAcw@mail.gmail.com>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <CACRpkda9e8FtjR3XB97Lu8X5=yeApk==4+zSqo3Qp6bWxgJAcw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_185911_504178_ED73C4A4 
X-CRM114-Status: GOOD (  11.45  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211109025907.tii0TAawVrmLgP869E6J9PD-PTbkIXBxSY-LWQKz-cs@z>



On 11/8/21 20:07, Linus Walleij wrote:
> On Wed, Nov 3, 2021 at 2:38 AM Jesse Taube <mr.bossman075@gmail.com> wrote:
> 
>> Ah I thought it would stop make at error i see it now, is there a way to
>> do one file.
> 
> Yes:
> 
> make dt_binding_check DT_SCHEMA_FILES=Documentation/...
Thank you :). I'm sorry about the lack of activity recently but Giulio 
has his work and i have school, but don't worry we are making progress. 
Thanks so much for everyone's help with this, and dealing with my 
newbieness.
> Yours,
> Linus Walleij
> 

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
