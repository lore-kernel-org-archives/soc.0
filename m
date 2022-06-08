Return-Path: <SRS0=cZg1=WP=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7905C433EF
	for <soc@archiver.kernel.org>; Wed,  8 Jun 2022 12:43:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 775E5C3411F; Wed,  8 Jun 2022 12:43:38 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CCF44C34116;
	Wed,  8 Jun 2022 12:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CCF44C34116
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id q26so17843108wra.1;
        Wed, 08 Jun 2022 05:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=aY7r4yTKm2xCpPz/pdiKlk0h2yN8SM+rM/FjpZoYYMw=;
        b=NDY3SH9q98Z9CZTcyhRUWPTOs9Lb3n/adZPCk3dwT5rIiMiuL5iFhOLUqFpotEw7m0
         svPBNvqpi9DQnOSl2fJTLj/8gEPRqTcWgduVmfutDAlvVaz7U6zjzibNDVuvz3I/lP94
         Oksne5gvWugvQPtwQPEqRslsGzZo4rJDgA4C40faVSSbOpk8ZP3X3/x2OzUP/JJeQuR/
         j9BB/fXGyBkVnhJNGP73s8HonwdSOndXFDQFi8DdXLR/mN2p++v4kyvIEZnzpqsn4mLE
         9GMDNy860FFve9QsfRvnQobnB5n0RmCHvn2HXScW79SKQYmM1bwFrNoxSLUTzXYdepKj
         EpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aY7r4yTKm2xCpPz/pdiKlk0h2yN8SM+rM/FjpZoYYMw=;
        b=BmWwUZ9HzAGXscuAh7ls/3e+KaWTyHrsqyM6WFQGv4zXhGsUyCajd4xPW559Ak4D4v
         fB6fY8p+rk7u9MppaUCX+UKg5+lZaUrY00yYDklnMGMr6zdUd2CNtpOzx0lRp21HQ/Yy
         i3Aidy4IRVtTEUMpRczt3RhNL8ywoT/EzLRfLpgBGmVrpbqTixbPCnJOKqtadDG2Qh8X
         +NMh0G9EF7V3HXwdrmLwjPu5HmSLztFELnaMQhDiN5TcklgkUUhpYebOuIFhSurh5IoY
         H7F758Md0aD1ZY90Bc8I9grWoL3MnD2qelSsUWZgF1I3uXhMgjeAOn1KG3MGy1cShRL9
         lCjg==
X-Gm-Message-State: AOAM530u3/J5eJJFnaUaakUoMiMDM3zWzkA6INYoIDEl2cR0/3L62pGp
	wz8f0FL2z+alj1ZMzX11gc8ctEi9dIInM2n/
X-Google-Smtp-Source: ABdhPJz4+PgEdPiMWzD2ANQx90cA5R5qq56S7VAYRjQkJLHfXYYyKH93iVoGcLEHbWugONAAROA0hg==
X-Received: by 2002:adf:a49e:0:b0:210:2eb7:559d with SMTP id g30-20020adfa49e000000b002102eb7559dmr33584138wrb.53.1654692215463;
        Wed, 08 Jun 2022 05:43:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:58e:6120:8c0d:a21d:4424:54a3? ([2a01:e0a:58e:6120:8c0d:a21d:4424:54a3])
        by smtp.gmail.com with ESMTPSA id r9-20020adfe689000000b0020c5253d8d0sm20846834wrm.28.2022.06.08.05.43.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 05:43:34 -0700 (PDT)
Message-ID: <f2336ca6-b4f1-82a5-8b53-07ebadf4fe68@gmail.com>
Date: Wed, 8 Jun 2022 14:43:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [GIT PULL 2/2] Broadcom maintainers fixes for 5.19
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 linux-arm-kernel@lists.infradead.org, arnd@arndb.de, olof@lixom.net,
 khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
References: <20220608093132.1465703-1-f.fainelli@gmail.com>
 <20220608093132.1465703-2-f.fainelli@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220608093132.1465703-2-f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/8/2022 11:31 AM, Florian Fainelli wrote:
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>    Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.19/maintainers-fixes
> 
> for you to fetch changes up to 46d6e11320d21dc40fce229ab3504125847de27e:
> 
>    MAINTAINERS: Update BCM2711/BCM2835 maintainer (2022-06-08 01:00:47 -0700)

I am going to submit a v2 where the git tree is also changes such that 
we do not confuse submitters with a "stale" tree.
-- 
Florian
