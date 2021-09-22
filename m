Return-Path: <SRS0=I0Tm=OM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D616DC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Sep 2021 20:53:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A72AB6112F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Sep 2021 20:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A72AB6112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SvFAOxnGGg971TLJEbNkV1dil30MC7qrYkGdd/zCnE4=; b=s48Dkpu9AEo3ns
	9zNVTE1IlmwJFZqMtKmXMGvufqwAVXwK2sYEFq8DtUhS7ZJDcj8G4qlvtT+6xovddDM7JZicgia6I
	oTnxKYmSUeIWcLaUkQU21TVrQoHAFHSB6jsHJNwRBJVI2UsrRsdRZCMbt0VxUPhGrF/T2HmP/smiy
	VV/jaMeoYONoBl5YS3I28vA2z4PPSAPHSj6ZKMr0EhFCWRHSBhPkMO+JkudzT4fDTfzZk+DgmvjYl
	XsRp6FQXZXnGaqZKV3UYQB0mbFVXGcPWV9Vb1OZgBtD5ns/gEqAZ8idG+ondxwJM01V5S6uuuSWys
	uKLpTK8eypp7NI5BbgYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mT9DX-009ctj-8n; Wed, 22 Sep 2021 20:51:47 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mT9DT-009ctC-NR
 for linux-arm-kernel@lists.infradead.org; Wed, 22 Sep 2021 20:51:44 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 x33-20020a9d37a4000000b0054733a85462so5383933otb.10
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 22 Sep 2021 13:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=K0e+QIxMALBQhCsB26FgEJQQDulL1SytM9MRZsK5UAg=;
 b=HVAvIQRevoL87W6Ay+rkCfwn6R7TuZAP4+H2RLZrp7RzY1vxpO9WiLWTVxxdmMffrF
 7FJrLhmi75WWytnU71Pj3WySvJX4jyj5EGWCUOTDMOORHzPvWFFdFc4MP4hFy1fkUZIR
 LCh/Ml78Axh10PQKch7gRhO6UBVf1t1Duro6r/oSlsSQrAPwaaCkWZVbOywqJyLsVuFj
 Y+DgURgDVT/7MeBAnObW9C29rEKm5+A7rw/UmOM5+RAC1unn5MWX8QfDTHWUIJRZACva
 t8QywY+5nWNpyfa+3r8VOQK+YURfUBU/IcBccy7ZZMgtCDgaKKUUwqg3j86ZrrK3vRFc
 E0iA==
X-Gm-Message-State: AOAM533wdN0qXseei7fi6K9ukz85e3GoT6kyuZPQyU/SmmdSBg5ICFk5
 GNn6N3Xoo6jTfavkhkO48Q==
X-Google-Smtp-Source: ABdhPJy6OpIj46BmIEk9sdynWbEHNejhn0TTMdLRFY3I5UsBmDoeryrQJAxSoYcMR2hPTg5RzxfBMg==
X-Received: by 2002:a9d:3e5e:: with SMTP id h30mr1018357otg.255.1632343902316; 
 Wed, 22 Sep 2021 13:51:42 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id p2sm796463ooe.34.2021.09.22.13.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 13:51:41 -0700 (PDT)
Received: (nullmailer pid 1271985 invoked by uid 1000);
 Wed, 22 Sep 2021 20:51:41 -0000
Date: Wed, 22 Sep 2021 15:51:41 -0500
From: Rob Herring <robh@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
List-Id: <soc.lore.kernel.org>
Cc: kernel@pengutronix.de, olof@lixom.net, krzk@kernel.org, linux-imx@nxp.com,
 robh+dt@kernel.org, shawnguo@kernel.org, festevam@gmail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 s.hauer@pengutronix.de, leoyang.li@nxp.com, linux-kernel@vger.kernel.org,
 soc@kernel.org, arnd@arndb.de
Subject: Re: [PATCH 1/4] dt-bindings: arm: fsl: Add E70K02 based ebook readers
Message-ID: <YUuXXRPyIDQseQhk@robh.at.kernel.org>
References: <20210918141627.2142457-1-andreas@kemnade.info>
 <20210918141627.2142457-2-andreas@kemnade.info>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210918141627.2142457-2-andreas@kemnade.info>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210922_135143_807338_56C509A3 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210922205141.N0oytJmOJGn3uVgkeqoYcBTKEyekdZPvOD54lZO012g@z>

On Sat, 18 Sep 2021 16:16:24 +0200, Andreas Kemnade wrote:
> Add the Kobo Libra H2O and Tolino Vision 5.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
