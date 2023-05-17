Return-Path: <SRS0=64NK=BG=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E823C77B75
	for <soc@archiver.kernel.org>; Wed, 17 May 2023 07:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45532C4339B; Wed, 17 May 2023 07:28:02 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 34A3AC433D2
	for <soc@kernel.org>; Wed, 17 May 2023 07:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 34A3AC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-55a8e9e2c53so2818187b3.1
        for <soc@kernel.org>; Wed, 17 May 2023 00:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684308480; x=1686900480;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OrwqWk2bWNKOSrtc/x6QkZwtop8uir/Nx5QXfysiiao=;
        b=JyK0dJUPYDQSjStEhHuUxOLFHBRn7E8uzaDRQKC6KFBSBf2cweyewJ8wAlSwxFT51P
         5iVvvmpG7EHmhXw0qffKLNfKA6I4pm/51jegIB3eTPmWmbUW95mEjUFsBgmni3XcbFZt
         +yL8n7EmKLzcGbOPMEffQz82vEzzv2vmHUMdANybG6lqm4oO5zJctbRvjHmXLCPF3LUg
         zYgy5bqmJMmpyuCuckMsEaPQpDkG/MmaHoptqKJ2oMRlbb69cBcE5xQ2Jtxjz6PF/i9e
         4lA/w4Mu+0C7yo5omW/JkwpQk+FM03hgN7xk6Ea69+yCALOZMQkLkzfuaGa69NA7/RiQ
         3W/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684308480; x=1686900480;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OrwqWk2bWNKOSrtc/x6QkZwtop8uir/Nx5QXfysiiao=;
        b=PYTSdQb+jK2boMi1YgD9VelO59G9PK4od+s9/O2ZuXmSSgPdTNs8yr4RDPmPJb1UlU
         nvAUsWZZ+hz4BLoU4oGpDQ4MYL6NtaGyOrDfz+ClZcs68O+z3o5xFDdviIiL63p7cyyP
         I3VrMvYF+/IxdXU+YqYiLiYDxprtfRLK48nytWzYNyDTRoNC5CWwJZh0Hw9y9MEoTRb7
         R8syKsss1TVco6ronikgoRd1qtbxUYM2yOwfBlsuqv1CfYulQgws7UAiMtK4QGnau3PA
         atUOGewFwFwP9x7UZ4MuLOHoG4DAGK67tg8JDHhizvvnSyaawp0hOvIiCYuj+8PR+o/J
         36Aw==
X-Gm-Message-State: AC+VfDyoAlsTEe0w1Tw9wT0pjxSqPLDvhlcHWYWWQLvFGNRH6/NO/i0v
	9jAcO70TQ6HM6xfsSeagLRCN4Tk1CpSuEkkhdBaHUmQ5Cv8fPrwA3hg=
X-Google-Smtp-Source: ACHHUZ6wpuKDdYOMRDgLIBs/yX5qbop9yPt3tw02sithV7avf76JI7OyIlfb4B5CXp5ontHPbF1/rM5pUTd4FgVrl1Q=
X-Received: by 2002:a81:6cc7:0:b0:561:b00d:1e12 with SMTP id
 h190-20020a816cc7000000b00561b00d1e12mr2722807ywc.29.1684308479948; Wed, 17
 May 2023 00:27:59 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 May 2023 09:27:48 +0200
Message-ID: <CACRpkdbEQ7nTnJTj5WMtxvH057fDSbX5tNs5j4Y=5KSBMpa-Sw@mail.gmail.com>
Subject: [GIT PULL] SoC/misc: SRAM driver and binding updates
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC folks,

it seems most natural to pull these misc/sram driver changes
into the SoC tree.

Please pull it in, some notes in the signed tag.

Yours,
Linus Walleij


The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/sram-for-soc

for you to fetch changes up to 21e5a2d10c8f319be4126f320855429842473640:

  misc: sram: Generate unique names for subpools (2023-05-17 09:15:25 +0200)

----------------------------------------------------------------
This fixes a small bug in the SRAM misc driver and adds
a compatible for SRAMs to the SRAM bindings.

----------------------------------------------------------------
Linus Walleij (2):
      dt-bindings: sram: Add compatible for ST-Ericsson U8500 eSRAM
      misc: sram: Generate unique names for subpools

 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 drivers/misc/sram.c                              | 9 +++++----
 2 files changed, 6 insertions(+), 4 deletions(-)
