Return-Path: <SRS0=nIBs=25=gmail.com=tjnenka88@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46FAECAAA1
	for <soc@archiver.kernel.org>; Fri, 28 Oct 2022 21:03:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6D4DAC4314D; Fri, 28 Oct 2022 21:03:30 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 727F3C433D7;
	Fri, 28 Oct 2022 21:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 727F3C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f54.google.com with SMTP id e15so5646218iof.2;
        Fri, 28 Oct 2022 14:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EuFYypSvKCuly8AXdkUrFSQrNc7/prihKIATjwcpVCk=;
        b=gvOSYkJTQ7h5mx/r2r05OszcrGbCHSILHzgG+NGu9lYd1VNaoAuh35WDQrMOyN7hB/
         WEDIsRXWE+D7lYH3Q/cGwyNTB4yHMQra3/469m5Go0ZZGb+9QLkSHJHDj9WLvyL2GBO0
         9NyKX6cCBGscn+VgzgPxScwjoS9u/etovrEhbSgcqLhS93XLd/XfghCi6AnUMbpI9DZp
         rIufwHQZf9pM+Mao6tYhghCPcQUKY426BkCr5st+ZnTL1ZrHG6a7gxaU6y5NpQz/0J7Y
         JdiFy6HBG+uFBHCMkpZ0HGMiU/nz6rymSG5xakDS40b7+P/ahWY5NPLCIyFnOBAku0Pa
         y3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EuFYypSvKCuly8AXdkUrFSQrNc7/prihKIATjwcpVCk=;
        b=6HKLUn/ZgfXvKL3ybLNkVJ2s8RE1TawqYrn6TwgMdthuEyEDsBdaZ+NwTLEmVy2qOv
         I2TQ++CrCN/GdSweIRloeoAYLuCryTgvrF1fkO74XGNHKC8wF/4Z2HBfiP7Xgx1qT1uY
         BGK7bdvPI6RWMIxDXPjdl0QpQYl1l7inz64aq+C2V1RUp+cQIC2Jj8Gcu54TQqcG4ZAI
         b55yUMQxkc3XTfJJos+KRNxb1uYRiQnyJ9yp2FDIr1oaQedKEle3uLXg6WPLu2woy/5n
         1yARRwDeJ+DI3LcRdiayEjlbv8zx8vAykL4LH+1F8CJCp8w5/+idiHy1mZdBca8VytfV
         5dpA==
X-Gm-Message-State: ACrzQf399qAKG5nTgs5E8pAbbD6eiEOEQbXnR9FreGLCbrxhFyi4Ld2P
	jJINOIyX4PrXl6FcLckDC+BD12sAJ7o=
X-Google-Smtp-Source: AMsMyM6nPDh62j/mrRAeJBd9QgoQf92T7TND2yuyo6Q0sg8GMd+4mPLk5n/5vl30ERgK95aGMs0+vQ==
X-Received: by 2002:a05:6602:1554:b0:6bc:b47f:5f47 with SMTP id h20-20020a056602155400b006bcb47f5f47mr703348iow.141.1666991008097;
        Fri, 28 Oct 2022 14:03:28 -0700 (PDT)
Received: from DM6PR15MB4008.namprd15.prod.outlook.com ([2603:1036:301:22a9::5])
        by smtp.gmail.com with ESMTPSA id o3-20020a05660213c300b0068994e773e7sm2115535iov.26.2022.10.28.14.03.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Oct 2022 14:03:27 -0700 (PDT)
From: Tj Nenka <tjnenka88@gmail.com>
To: "arnd@kernel.org" <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "soc@kernel.org" <soc@kernel.org>,
	"torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL 0/5] SoC changes for 5.17
Thread-Topic: [GIT PULL 0/5] SoC changes for 5.17
Thread-Index: AQHY6xCvuaYYKULWrE2gN+SqOa5aAQ==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Fri, 28 Oct 2022 21:03:24 +0000
Message-ID:
	<DM6PR15MB40086A66BE1FF2FBCFFB8C56FD329@DM6PR15MB4008.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator:
X-MS-Exchange-Organization-RecordReviewCfmType: 0
Content-Type: multipart/alternative;
	boundary="_000_DM6PR15MB40086A66BE1FF2FBCFFB8C56FD329DM6PR15MB4008namp_"
MIME-Version: 1.0

--_000_DM6PR15MB40086A66BE1FF2FBCFFB8C56FD329DM6PR15MB4008namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



Get Outlook for Android<https://aka.ms/AAb9ysg>

--_000_DM6PR15MB40086A66BE1FF2FBCFFB8C56FD329DM6PR15MB4008namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div><br>
</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"auto">
<div><br>
</div>
Get <a href=3D"https://aka.ms/AAb9ysg">Outlook for Android</a></div>
</body>
</html>

--_000_DM6PR15MB40086A66BE1FF2FBCFFB8C56FD329DM6PR15MB4008namp_--
