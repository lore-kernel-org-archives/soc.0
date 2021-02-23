Return-Path: <SRS0=smCM=HZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91443C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Feb 2021 19:35:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44F5764E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Feb 2021 19:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44F5764E60
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rskOTqIu4ShB4mAqcG39FGQewrJUHkyLs1ejRRIGU/M=; b=BB0VJrllUte9mh97MfDL2wRHSW
	p4IkB37Nr0n+Y16G1iPPRoNL0+smRzvPze9iapsTdbIzTrn3K28i/s4Gk9egx/J8366xhU93mz3AA
	dCv/jcobgZ0WZnnlrVdn/ZsWeNKZgJ6OQv/rfpLpPAeAIuUGIqjhk5fwm0Hy2KXxi8Nxm6s9jhreI
	O8JKbdyNA6bJ/LymGGDDFCYUQtcfqkbUtB/dBY+r9Z2stsrQgrdaVB5FZrZ/zdzBCXJhAxRwKEJ5/
	cRavTlSq8SCU6Vgzpv2y6uRPgcrIRZ5nujiDAT+FJ7ylnV5z2d3FKkUD6L82F6+YC4e15htnyMCSV
	4BNoRB3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEdRq-0005MI-NI; Tue, 23 Feb 2021 19:34:18 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEdRn-0005LW-Cy
 for linux-arm-kernel@lists.infradead.org; Tue, 23 Feb 2021 19:34:16 +0000
Received: by mail-oi1-f175.google.com with SMTP id l133so10589160oib.4
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 23 Feb 2021 11:34:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Jd0iJwzzoy2OV01YxLUppnxWSo+h7hTXkFr7aHmltkk=;
 b=UN3rJe2cDl8SE2o5H6bGKjwKQhg6lNpsR1NvG/Opm6pIGCQE+CoRE/el/123UuAkjc
 7CJXTZPAM5Ng4SyTUK+4fy9sJN3bLG3DRH3mdVI9aZyvVLtUTPAiCTnuf/S/MDX69rIW
 x0laBqccQdrWKQ0WRjp/s3NtYBLkXQoxldt8xce4JrDxKaDf3D5DHzU1gAytSEwnQ79c
 pcnLWJ2hbswrVQCmkq/XCRtOxhm5dNgYFI4epWeDYNG6eskrTUo8dSd0qqYcceIk0xPk
 kzg4jpm56qcFEGkOvFhDFW9X/HDFCU91xvgA0OUja+JuQovX+RNDOVl/caO7sjJ9lFn9
 ubEA==
X-Gm-Message-State: AOAM533jH8Oq0/Tnc0MbpDK0A6OMFUqDaAwyKqrhXCEFfTBdq59LVvTK
 SsCLthifpyus1bbVwgKpZw==
X-Google-Smtp-Source: ABdhPJy1jssNdKq9KMlLx33dO0mbsh9DPwl9N6mfsOaL+GaoxMUl57imtSClS4z55ss1nOpkGacR2g==
X-Received: by 2002:a05:6808:d47:: with SMTP id
 w7mr257519oik.150.1614108852913; 
 Tue, 23 Feb 2021 11:34:12 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q25sm4528236ota.16.2021.02.23.11.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 11:34:11 -0800 (PST)
Received: (nullmailer pid 4116104 invoked by uid 1000);
 Tue, 23 Feb 2021 19:34:10 -0000
From: Rob Herring <robh@kernel.org>
To: Daniel Palmer <daniel@0x0f.com>
In-Reply-To: <20210223061830.1913700-2-daniel@0x0f.com>
References: <20210223061830.1913700-1-daniel@0x0f.com>
 <20210223061830.1913700-2-daniel@0x0f.com>
Subject: Re: [PATCH 1/8] dt-bindings: clk: mstar msc313 cpupll binding
 description
Date: Tue, 23 Feb 2021 13:34:10 -0600
Message-ID: <1614108850.540354.4116103.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_143415_637394_30027EAD 
X-CRM114-Status: GOOD (  12.63  )
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
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, linux-kernel@vger.kernel.org,
 w@1wt.eu, soc@kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210223193410.stS0w0MNz6Z1B7I-pYBfBE8ZLKg-FkRPZO_i5iJjhEs@z>

On Tue, 23 Feb 2021 15:18:23 +0900, Daniel Palmer wrote:
> Add a binding description for the MStar/SigmaStar CPU PLL block.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  .../bindings/clock/mstar,msc313-cpupll.yaml   | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.example.dts:19:18: fatal error: dt-bindings/clock/mstar-msc313-mpll.h: No such file or directory
   19 |         #include <dt-bindings/clock/mstar-msc313-mpll.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:344: Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1370: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1443402

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
