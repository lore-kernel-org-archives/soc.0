Return-Path: <SRS0=mshz=KL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E62CC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 May 2021 16:58:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A60960233
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 May 2021 16:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A60960233
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/Fnm5HiMrUNinksKrJ2pdlVP/dFr3I0S9FIeyQ5+wBw=; b=QqTsGpJeWCjpyppBYrXs3zWSf
	S2N0monT9R1X0Jiwb5RZTXJSZPNZU50EnbKUII3kMcesPfqXCu0FhEeO69d4w4q7z7pew7JaoWEBi
	IffaupMY0AnwyrjA/RBd0uPpXRwKD8pq6i4w6nCQem6GTB99LTsmVEwHdBGfqZN9A5IvOr2DHH8/J
	9qn+Z4q8yJsNXuuogJJZhC61Ko/pwvi4X7yjgO61gI+8nZZJZmVZMgUon1yzt/tMQYMO+n67yF+v3
	1fG8GGyGWyifmv6SwsiL0hUgLs7capkdKuCz6EJ3ARyte0HGzG0WEtiPAgcW4azWFPo/ID9Jjb5vI
	62ZHUz0Eg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liK4a-00CbmG-8A; Sun, 16 May 2021 16:57:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liK4U-00Cblj-Na; Sun, 16 May 2021 16:56:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=KXfPWqkBpp539m/dUT5eP3L2ZdWd5jXj1ZEc3b/o1Vs=; b=Z5gwpVCHdwlWOqHzv5hJqrVK7o
 ELbdwMN5vu4hpCvcIIa9UKNHXoCdvEnuvS0AwrIxYTD/Tts+tmxmuQr9UzdYQWx5WjcYpSGcy9I8z
 PqyhcWVtiFv/TPWBczSabo3KONJog2xDolwe1TTLciL1l9dwtrnfPYCXP5/b0+hMi+CusWldJprIv
 jbxf0ON+yfVjqriZ0BDMW+U6HLl7WyMQVwsNRhgl9qTZMcQ37q8YDehqEP6JRzpZoqZ4b5P1Wg9LL
 Js1pwwck7Xb6cNIHUeDj8C9hvRZhmsOXzcKKS+9Z1ZXAbSO/zBbGNDbtR0w0EUlXKF+kQj24qUMQT
 Xyw19zzA==;
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liK4R-00D3yQ-UO; Sun, 16 May 2021 16:56:53 +0000
Received: by mail-ej1-x630.google.com with SMTP id p24so4459668ejb.1;
 Sun, 16 May 2021 09:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KXfPWqkBpp539m/dUT5eP3L2ZdWd5jXj1ZEc3b/o1Vs=;
 b=P3YmCa/Sb01lTppd7f0Sb7fuidhircakszYHYjhrJtAHZBHwg8aB/zX3sMH3zjdSPM
 +Db5N7dbepitFXSQdr6ucA/MSYIr/e5yOGnEYKip7iEms/grB1taKYYJvne8R1Lnvk4k
 27yEJVf8s1M2IU56yrBQwoXFMT8cZz20DVAIaIU/vabuuQ3JaQRIuDxGCSkztBNSKJUx
 IknJz5HeGHENTDHVp8HytRo3SazyynuDx3Jzgn98izFef62ZR6xbq65zF6fztOLUlmjZ
 eBuKhY1qFaGyFbVRNBk64k93zyOt1Yko34cA2dWiQx3ZHF/DjbZivoTTDmN6sO0m/ZBo
 mhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KXfPWqkBpp539m/dUT5eP3L2ZdWd5jXj1ZEc3b/o1Vs=;
 b=A91VGVgluBrwXUOxSz3fvo/O9Ra6+h/4H22CDYK6ctaazREfHhcYEvvtFSpjR4Vha5
 1imJxl1CcOs5s45DKeWGygc25se6UZhG9ICk41wodAVPCU+Iqw/mK8Bg/l92+ewWPwIG
 fRRo6PB70TifnTc66vnCWCTxFHMOE4cbu0flTEsRb32nYeWo6CURbXQ4EwzoP+Sr1+Ek
 Yk/QFty55gaf4hFe9WovbRbfU68I5axo8tHQSWdlsVId0wQKjadPI+qbiAtKEFWgA6oT
 T2xc9Ec0AivojGU6EyYLQhtWHEdCvKnK2KUuoHPj1hsTe6CVIcJeUnDPn1Wcjq1JUnwz
 lj3w==
X-Gm-Message-State: AOAM533lO5qteKFI22RT6ad+B/wkHA4uM5CeGlhhc0RoA1iNmVykPdh/
 c5CeSCXpFHmvrOBIj4gEf55+ouhhkh0yG/1JL29HW9iZK/4=
X-Google-Smtp-Source: ABdhPJwc41Kg2PCVAk+BV4t6/mT7qgy9bZ0g/8+LHR9oFdkh04GMWq15AhUV0qiUw+4YKrsy9vuUpMTLwDfrnBjDwOE=
X-Received: by 2002:a17:906:374b:: with SMTP id
 e11mr58369970ejc.328.1621184209341; 
 Sun, 16 May 2021 09:56:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210511190054.26300-1-khilman@baylibre.com>
In-Reply-To: <20210511190054.26300-1-khilman@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 16 May 2021 18:56:38 +0200
Message-ID: <CAFBinCCTQMF8MAcffR30o5K06EKV==C-5EJ4_aEvZWWqSJ+eaQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: ARM/Amlogic SoCs: add Neil as primary
 maintainer
To: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Neil Armstrong <narmstrong@baylibre.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210516_095652_014795_4B2C0F9A 
X-CRM114-Status: GOOD (  10.63  )
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
Message-ID: <20210516165638.XMQbQPZ0xUEAmiW3HBZRg8dTuJmMY2Qs7AdTSZzArHg@z>

On Tue, May 11, 2021 at 9:01 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Add Neil as primary maintainer for the Amlogic family of Arm SoCs.  I
> will now act as co-maintainer.
Thanks for your work since May 2016 Kevin!

> Neil is already doing lots of the reviewing, testing and behind the
> scenes support for users of the upstream kernel on these SoCs, so this
> is just to formalize the current state of affairs.
>
> Thanks Neil for all of your efforts, and keep up the great work!
Indeed, and also "welcome" to your new position Neil

> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Best regards,
Martin

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
